# f5-xc-zg01-lb

This repo contains terraform manifests to configure LB/origin pools to reach devices
behind the F5 XC CE site zg01:

| host    | ssh command                         |
| ------- | ----------------------------------- |
| perf1   | ssh -p 1011 ubuntu@xeon1.mwlabs.net |
| perf2   | ssh -p 1012 ubuntu@xeon1.mwlabs.net |
| ryzen1  | ssh -p 1021 admin@xeon1.mwlabs.net  |
| ryzen2  | ssh -p 1022 admin@xeon1.mwlabs.net  |
