# Создаем директории и файлы для дисковых групп

# Директории для дисковых групп
mkdir -p /u01/cuteduck
mkdir -p /u01/beautifulchicken
mkdir -p /u01/cuteelephant

# Задаем владельца директорий oracle и группу dba
chown oracle:dba /u01/cuteduck
chown oracle:dba /u01/beautifulchicken
chown oracle:dba /u01/cuteelephant

# Файлы для дисков дисковой группы cuteduck
/usr/sbin/mkfile -n 500m /u01/cuteduck/cuteduck0
/usr/sbin/mkfile -n 500m /u01/cuteduck/cuteduck1
/usr/sbin/mkfile -n 500m /u01/cuteduck/cuteduck2
/usr/sbin/mkfile -n 500m /u01/cuteduck/cuteduck3

# Файлы для дисков дисковой группы beautifulchicken
/usr/sbin/mkfile -n 500m /u01/beautifulchicken/beautifulchicken0
/usr/sbin/mkfile -n 500m /u01/beautifulchicken/beautifulchicken1
/usr/sbin/mkfile -n 500m /u01/beautifulchicken/beautifulchicken2
/usr/sbin/mkfile -n 500m /u01/beautifulchicken/beautifulchicken3
/usr/sbin/mkfile -n 500m /u01/beautifulchicken/beautifulchicken4
/usr/sbin/mkfile -n 500m /u01/beautifulchicken/beautifulchicken5
/usr/sbin/mkfile -n 500m /u01/beautifulchicken/beautifulchicken6

# Файлы для дисков дисковой группы cuteelephant
/usr/sbin/mkfile -n 500m /u01/cuteelephant/cuteelephant0
/usr/sbin/mkfile -n 500m /u01/cuteelephant/cuteelephant1
/usr/sbin/mkfile -n 500m /u01/cuteelephant/cuteelephant2
/usr/sbin/mkfile -n 500m /u01/cuteelephant/cuteelephant3
