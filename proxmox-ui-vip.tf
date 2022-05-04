resource "volterra_origin_pool" "proxmox-ui-vip" {
  name                   = format("%s-proxmox-ui-vip", var.projectPrefix)
  namespace              = var.namespace
  endpoint_selection     = "LOCAL_PREFERRED"
  loadbalancer_algorithm = "LB_OVERRIDE"
  no_tls                 = true
  port                   = 8006

  origin_servers {
    private_ip {
      ip = "192.168.2.100"
        site_locator {
          site {
            namespace = "system"
            name      = var.siteName
          }
        }
    }
  }

  healthcheck {
    name = format("%s-proxmox-ui-vip", var.projectPrefix)
  }
}

resource "volterra_healthcheck" "proxmox-ui-vip" {
  name      = format("%s-proxmox-ui-vip", var.projectPrefix)
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

resource "volterra_tcp_loadbalancer" "proxmox-ui-vip" {
  name      = format("%s-proxmox-ui-vip", var.projectPrefix)
  namespace = var.namespace

  dns_volterra_managed = false

  origin_pools_weights {
    pool {
      namespace = var.namespace
      name = volterra_origin_pool.proxmox-ui-vip.name
    }
  }

  advertise_custom {
    advertise_where {
      port = 8006
      site {
        network = "SITE_NETWORK_OUTSIDE"
        ip = "94.231.81.88"
        site {
          name = var.siteName
          namespace = "system"
        }
      }
    }
  }
}
