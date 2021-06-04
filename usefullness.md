## Перед запуском скриптов

```bash
crsctl enable has
crsctl start res ora.cssd -init
srvctl add asm
srvctl start asm
```

## Чтобы удалить чужие инстансы ASM

```bash
cd /u01/app/11.2.0/grid/dbs
rm *
cd
```

## Запуск скрипта

```bash
bash
cd /u01/txo83_scripts/
. main.sh
```
