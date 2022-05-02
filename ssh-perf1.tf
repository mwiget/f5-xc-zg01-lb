resource "volterra_origin_pool" "ssh-perf1" {
  name                   = format("%s-ssh-perf1", var.projectPrefix)
  namespace              = var.namespace
  endpoint_selection     = "LOCAL_PREFERRED"
  loadbalancer_algorithm = "LB_OVERRIDE"
  no_tls                 = true
  port                   = 22

  origin_servers {
    private_ip {
      ip = "192.168.2.176"
        site_locator {
          site {
            namespace = "system"
            name      = var.siteName
          }
        }
    }
  }

  healthcheck {
    name = format("%s-ssh-perf1", var.projectPrefix)
  }
}

resource "volterra_healthcheck" "ssh-perf1" {
  name      = format("%s-ssh-perf1", var.projectPrefix)
  namespace = var.namespace

  tcp_health_check {
    expected_response = ""
    send_payload = ""
  }

  healthy_threshold   = 3
  interval            = 15
  timeout             = 3
  unhealthy_threshold = 1
  jitter_percent      = 30
}

resource "volterra_tcp_loadbalancer" "ssh-perf1" {
  name      = format("%s-ssh-perf1", var.projectPrefix)
  namespace = var.namespace

  dns_volterra_managed = false

  origin_pools_weights {
    pool {
      namespace = var.namespace
      name = volterra_origin_pool.ssh-perf1.name
    }
  }

  advertise_custom {
    advertise_where {
      port = 1011
      site {
        network = "SITE_NETWORK_OUTSIDE"
        site {
          name = var.siteName
          namespace = "system"
        }
      }
    }
  }
  depends_on = [ volterra_origin_pool.ssh-perf1 ]
}
