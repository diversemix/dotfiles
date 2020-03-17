# Hardware

## DrevoCalibur V2 TE Keyboard

Run the following command so function keys are by default:

```
echo 0 | pkexec tee /sys/module/hid_apple/parameters/fnmode
```

