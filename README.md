# rtems_demo


## 构建工具链

```shell
./compiler.sh arm 6
./compiler.sh aarch64 6
./compiler.sh x86_64 6
```

## 构建SDK与demo

1. arm

```shell
./build.sh arm stm32f4
./build.sh arm raspberrypi2
```

2. aarch64

```shell
./build.sh aarch64 a72_lp64_qemu
./build.sh aarch64 raspberrypi4
```

3. x86_64

```shell
./build.sh x86_64 amd64
./build.sh x86_64 amd64efi
```
