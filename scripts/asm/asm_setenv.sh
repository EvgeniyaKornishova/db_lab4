echo "ASM environment variables have been set."

export ORACLE_SID=kornishovaevgeniyap33112asm
export ORACLE_HOME=$ORACLE_MOUNT_POINT/app/11.2.0/grid
export PATH=$PATH:$ORACLE_HOME/bin
# Позволяет отличить экземпляр базы данных от экземпляра ASM;
# может принимать значение RDBMS и ASM
export INSTANCE_TYPE=ASM
# Имя сервиса ASM, по умолчанию "+ASM"
export DB_UNIQUE_NAME=ASM265099
export INIT_FILE=init$ORACLE_SID.ora
# Количество ресурсов, которые может использовать ASM при балансировке БД;
# может принимать значение от 1(min) до 11(max)
export ASM_POWER_LIMIT=1

export ASM_DISKS_DEST="/u01"
# Список имен дисковых групп, которые ASM видит в момент запуска
export ASM_DISKGROUPS="cuteduck,beautifulchicken,cuteelephant"
# Задает список путей, по которым ASM должен искать потенциальные диски
export ASM_DISKSTRING="('/u01/cuteduck/*','/u01/beautifulchicken/*','/u01/cuteelephant/*')"
# Задает количество дисков в соответствующих дисковых группах
export DISKS_AMOUNTS_STR="4,7,4"
