docker pull chaosbladeio/chaosblade-demo
docker run -it --privileged chaosbladeio/chaosblade-demo

### Prepare java application experiment
blade prepare/p jvm --process business

### Create a experiment is delay 3s when invoke com.exampe.service.DemoService#sayHello service
blade create/c dubbo delay --time 3000 --service com.example.service.DemoService --methodname sayHello --consumer

### Create a experiment is throwing exception when request hello controller service(the request mapping method name is hello too)
blade create jvm throwCustomException --exception java.lang.Exception \
    --classname com.example.controller.DubboController --methodname hello

### Burn cpu, execute the flow command and use top command to check cpu stats. You can execute destroy command to stop the experiment
blade create cpu fullload

###  You can also add --timeout flag to set the experiment duration, the unit of timeout flag is second
blade create cpu fullload --timeout 30

### You can use status command to query the experiment status
blade status --type create
blade status --type prepare

### Destroy the experiment 
blade destory <UID>

### Undo chaos engineering experiment preparation
blade revoke <Uid>




