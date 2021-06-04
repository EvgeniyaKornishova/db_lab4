# на случай, если остались дисковые группы с предыдущего запуска
rm -rf /u01/cuteduck /u01/beautifulchicken /u01/cuteelephant /u01/happyturtle

# Phase 1

. setenv.sh
. asm/asm_setenv.sh
. asm/create_asminit.sh
. asm/create_diskgroups_files_first_phase.sh

sqlplus / as sysasm << EOF
CREATE SPFILE FROM PFILE;
STARTUP;
@asm/create_cuteduck.sql;
@asm/create_beautifulchicken.sql;
@asm/create_cuteelephant.sql;
@asm/display_disks.sql;
EXIT;
EOF

# Phase 2

# 1. Добавить новую дисковую группу happyturtle[3]; размер AU - 2 МБ.
echo "1. Добавить новую дисковую группу happyturtle[3]; размер AU - 2 МБ."

# Создаем директорию для дисковой группы happyturtle
mkdir -p /u01/happyturtle
# Задаем владельца директории oracle и группу dba
chown oracle:dba /u01/happyturtle

# Файлы для дисков дисковой группы happyturtle
/usr/sbin/mkfile -n 500m /u01/happyturtle/happyturtle0
/usr/sbin/mkfile -n 500m /u01/happyturtle/happyturtle1
/usr/sbin/mkfile -n 500m /u01/happyturtle/happyturtle2

sqlplus / as sysasm << EOF
 shutdown;
 startup nomount;

 alter system set asm_diskstring='/u01/beautifulchicken/*','/u01/cuteduck/*','/u01/cuteelephant/*','/u01/happyturtle/*';

 shutdown;
 startup mount;

 @asm/create_happyturtle.sql;
 @asm/display_disks.sql;
 EXIT;
EOF

# 2. Удалить диск #1 из группы cuteduck.
echo "2. Удалить диск #1 из группы cuteduck."

sqlplus / as sysasm << EOF
ALTER DISKGROUP cuteduck DROP DISK cuteduck1 REBALANCE WAIT;
@asm/display_disks.sql;
EXIT;
EOF

# 3. Пересоздать группу cuteduck, сконфигурировав в ней избыточность следующим образом:
#   Размер группы - 6 элементов.
#   Тип избыточности - NORMAL; количество failure-групп - 3.
#   Равномерно распределить диски по failure-группам.
echo "3. Пересоздать группу cuteduck, сконфигурировав в ней избыточность."

sqlplus / as sysasm << EOF
DROP DISKGROUP cuteduck;
EXIT;
EOF

# Создаем дополнительные файлы для дисков
/usr/sbin/mkfile -n 500m /u01/cuteduck/cuteduck4
/usr/sbin/mkfile -n 500m /u01/cuteduck/cuteduck5

sqlplus / as sysasm << EOF
@asm/recreate_cuteduck.sql;
@asm/display_disks.sql;
EXIT;
EOF


# 4. Удалить дисковую группу cuteduck.
echo "4. Удалить дисковую группу cuteduck."

sqlplus / as sysasm << EOF
DROP DISKGROUP cuteduck;
@asm/display_disks.sql;
EXIT;
EOF

# 5. Удалить диск #5 из группы beautifulchicken.
echo "5. Удалить диск #5 из группы beautifulchicken."

sqlplus / as sysasm << EOF
ALTER DISKGROUP beautifulchicken DROP DISK beautifulchicken5 REBALANCE WAIT;
@asm/display_disks.sql;
EXIT;
EOF

# 6. Пересоздать группу beautifulchicken, сконфигурировав в ней избыточность следующим образом:
#   Размер группы - 9 элементов.
#   Тип избыточности - HIGH; количество failure-групп - 3.
#   Равномерно распределить диски по failure-группам.
echo "6. Пересоздать группу beautifulchicken, сконфигурировав в ней избыточность."

sqlplus / as sysasm << EOF
DROP DISKGROUP beautifulchicken;
EXIT;
EOF

# Создаем дополнительные файлы для дисков
/usr/sbin/mkfile -n 500m /u01/beautifulchicken/beautifulchicken7
/usr/sbin/mkfile -n 500m /u01/beautifulchicken/beautifulchicken8

sqlplus / as sysasm << EOF
@asm/recreate_beautifulchicken.sql;
@asm/display_disks.sql;
EXIT;
EOF


# 7. Удалить дисковую группу beautifulchicken
echo "7. Удалить дисковую группу beautifulchicken."

sqlplus / as sysasm << EOF
DROP DISKGROUP beautifulchicken;
@asm/display_disks.sql;
EXIT;
EOF
