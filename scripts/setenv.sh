echo "Environment variables have been set."

# Путь к точке монтирования
export ORACLE_MOUNT_POINT=/u01

# Путь к 'корню' иерархии каталогово oracle
export ORACLE_BASE=$ORACLE_MOUNT_POINT/app/oracle

# Путь к корневому каталогу БД
export ORACLE_HOME=$ORACLE_BASE/product/11.2.0/dbhome_1

# Имя экземпляра oracle (обычно - имя БД + номер экземпляра)
export ORACLE_SID=kornishovaevgeniyap33112

# Имя БД
export DB_NAME=coolmom

# Стандартный путь до init файла
export ORACLE_INIT_FILE_DEST=$ORACLE_HOME/dbs

# Путь до файлов БД
export ORADATA=$ORACLE_MOUNT_POINT/txo83/$DB_NAME

# Название init файла
export INIT_FILE=init$ORACLE_SID.ora

# Путь до исполняемых файлов oracle (позволяет запускать sqlplus, rman и т.п.)
export PATH=$PATH:$ORACLE_HOME/bin

# Путь до библиотек oracle
export LD_LIBRARY_PATH=$ORACLE_HOME/lib

# Кодировка (Язык_Местность.НаборСимволов)
export NLS_LANG=American_America.UTF8
