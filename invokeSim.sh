docker run -it -e "IotHubConnectionString=HostName=your-iothub-name.azure-devices.net;SharedAccessKeyName=device;SharedAccessKey=your-iothub-key" -e Template="{ \"deviceId\": \"$.DeviceId\", \"rand_int\": $.Temp, \"rand_double\": $.DoubleValue, \"Ticks\": $.Ticks, \"Counter\": $.Counter, \"time\": \"$.Time\" }" -e Variables="[{name: \"Temp\", \"random\": true, \"max\": 25, \"min\": 23}, {\"name\":\"Counter\", \"min\":100, \"max\":102} ]" mcr.microsoft.com/oss/azure-samples/azureiot-telemetrysimulator

{ "deviceId": "sim000001", "rand_int": 23, "rand_double": 0.207759137669466, "Ticks": 637097550115091350, "Counter": 100, "time": "2019-11-19T10:10:11.5091350Z" }

Template="{ \"deviceId\": \"$.DeviceId\", \"rand_int\": $.Temp, \"rand_double\": $.DoubleValue, \"Ticks\": $.Ticks, \"Counter\": $.Counter, \"time\": \"$.Time\" }" 

-e Variables="[{name: \"Temp\", \"random\": true, \"max\": 0, \"min\": 100}, {\"name\":\"Humid\", \"min\":20, \"max\":100} ]"



{"type\": \"dynamb\", "data\": {\"deviceId\": \"Docker Sim\",\"deviceIdType\": \"2\",\"timestamp\": $.Time,\"temperature\": $.Temp,\"relativeHumidity\": $Humid}}


docker run -it -e \
 IotHubConnectionString="HostName=iot-pareto-hub.azure-devices.net;DeviceId=myDevice;SharedAccessKey=VZAvvTyaehzg61o97mviy3yE/6UoNpmsSnZekrkIUu8=" -e \
 Template="{\"type\": \"dynamb\", "data\": {\"deviceId\": $.MachineName,\"deviceIdType\": \"2\",\"timestamp\": $.LocalTime,\"temperature\": $.Temp,\"relativeHumidity\": $Humid}}" -e \
 Variables="[{name: \"Temp\", \"random\": true, \"max\": 0, \"min\": 100}, {\"name\":\"Humid\", \"min\":20, \"max\":100} ]" \
 simulatorspareto.azurecr.io/azureiot-telemetrysimulator:latest

 Template="{\"data\": {\"deviceId\": $.MachineName,\"deviceIdType\": \"2\",\"timestamp\": $.LocalTime,\"temperature\": $.Temp,\"relativeHumidity\": $Humid}}" -e \



docker run -it -e MessageCount=5 \
 -e IotHubConnectionString="HostName=iot-pareto-hub.azure-devices.net;SharedAccessKey=+/KC4DHAbpSUHxEvpGYG8lbVXzAYhZ1rLzyrX62u82Q=" \
 -e Template="{"type": "dynamb", "data": {"deviceId": "sim000001","deviceIdType": 2,"timestamp": $.Ticks,"temperature": $.Temp,"relativeHumidity": $.Humid}}"  \
 -e Variables="[{name: \"Temp\", \"max\": 0, \"min\": 100}, {\"name\":\"Humid\", \"min\":20, \"max\":100} ]" \
 simulatorspareto.azurecr.io/azureiot-telemetrysimulator:latest

