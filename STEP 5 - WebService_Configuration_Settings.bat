@echo off

SET /P WS_RUNNING_PORT=Enter webservice running PORT:
SET /P COM_PORT_NAME=Enter COM Port in which the device is connected:

curl -X POST http://localhost:%WS_RUNNING_PORT%/FABECRWeb/ECRWebService.asmx/Web_SaveSettings -H ^
    "Content-Type: application/x-www-form-urlencoded" -d ^
    "PortName=%COM_PORT_NAME%&BaudRate=19200&Timeout=30&TxnTimeout=300&UploadTimeout=300&Trace=True&Delay=True&DelayTimeout=2&WaitResMessge=False" ^
    --data-urlencode "TracePath=C:\FAB\ECR\Trace"
pause