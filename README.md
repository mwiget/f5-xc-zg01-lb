# f5-xc-zg01-lb

This repo contains terraform manifests to configure LB/origin pools to reach devices
behind the F5 XC CE site zg01:

| host    | ssh command                         | internal IP   |
| ------- | ----------------------------------- | ------------- |
| perf1   | ssh -p 1011 ubuntu@xeon1.mwlabs.net | 192.168.2.176 |
| perf2   | ssh -p 1012 ubuntu@xeon1.mwlabs.net | 192.168.2.192 |
| ryzen1  | ssh -p 1021 admin@xeon1.mwlabs.net  | 192.168.2.218 |
| ryzen2  | ssh -p 1022 admin@xeon1.mwlabs.net  | 192.168.2.30  |

and using a VIP:

| host    | ssh command                         | internal IP   |
| ------- | ----------------------------------- | ------------- |
| perf1   | ssh -p 1011 ubuntu@94.231.81.88     | 192.168.2.176 |
| perf2   | ssh -p 1012 ubuntu@94.231.81.88     | 192.168.2.192 |

