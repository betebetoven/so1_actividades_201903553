
# Tarea de Gestión de Usuarios y Permisos

**Nombre:** Alberto Hernandez  
**Carnet:** 201903553  

## Instrucciones
Crear un archivo `.md` y resolver cada uno de los ítems solicitados a continuación. Debe de colocar el comando utilizado así como el resultado si este fuera necesario.

---

## Parte 1: Gestión de Usuarios

### 1. Creación de Usuarios
Para crear tres usuarios llamados `usuario1`, `usuario2`, y `usuario3`, utilizamos el comando `useradd`.

```bash
sudo useradd usuario1
sudo useradd usuario2
sudo useradd usuario3
```

### 2. Asignación de Contraseñas
Para establecer contraseñas a cada usuario, utilizamos el comando `passwd`.

```bash
sudo passwd usuario1
sudo passwd usuario2
sudo passwd usuario3
```

Las contraseñas se ingresan interactivamente y no se muestran en la terminal por motivos de seguridad.

### 3. Información de Usuarios
Para mostrar la información del usuario `usuario1`, utilizamos el comando `id`.

```bash
id usuario1
```

**Resultado:**

```bash
uid=1001(usuario1) gid=1001(usuario1) groups=1001(usuario1)
```

### 4. Eliminación de Usuarios
Para eliminar `usuario3` pero conservar su directorio principal, utilizamos el comando `userdel` con la opción `--remove-home` para preservar el directorio.

```bash
sudo userdel --remove-home usuario3
```

---

## Parte 2: Gestión de Grupos

### 1. Creación de Grupos
Para crear dos grupos llamados `grupo1` y `grupo2`, utilizamos el comando `groupadd`.

```bash
sudo groupadd grupo1
sudo groupadd grupo2
```

### 2. Agregar Usuarios a Grupos
Para agregar `usuario1` a `grupo1` y `usuario2` a `grupo2`, utilizamos el comando `usermod`.

```bash
sudo usermod -aG grupo1 usuario1
sudo usermod -aG grupo2 usuario2
```

### 3. Verificar Membresía
Para verificar que los usuarios han sido agregados a los grupos, utilizamos el comando `groups`.

```bash
groups usuario1
groups usuario2
```

**Resultado:**

```bash
usuario1 : usuario1 grupo1
usuario2 : usuario2 grupo2
```

### 4. Eliminar Grupo
Para eliminar `grupo2`, utilizamos el comando `groupdel`.

```bash
sudo groupdel grupo2
```

---

## Parte 3: Gestión de Permisos

### 1. Creación de Archivos y Directorios
Como `usuario1`, crea un archivo llamado `archivo1.txt` en su directorio principal y escribe algo en él, luego crea un directorio llamado `directorio1` y dentro de ese directorio, un archivo llamado `archivo2.txt`.

```bash
# Cambiar a usuario1
su - usuario1

# Crear archivo y escribir en él
echo "Contenido de archivo1" > ~/archivo1.txt

# Crear directorio y archivo dentro de él
mkdir ~/directorio1
echo "Contenido de archivo2" > ~/directorio1/archivo2.txt
```

### 2. Verificar Permisos
Verifica los permisos del archivo y directorio usando el comando `ls -l` y `ls -ld` respectivamente.

```bash
ls -l ~/archivo1.txt
ls -ld ~/directorio1
ls -l ~/directorio1/archivo2.txt
```

**Resultado:**

```bash
-rw-r--r-- 1 usuario1 usuario1 20 ago  4 12:00 archivo1.txt
drwxr-xr-x 2 usuario1 usuario1 4096 ago  4 12:05 directorio1
-rw-r--r-- 1 usuario1 usuario1 24 ago  4 12:10 directorio1/archivo2.txt
```

### 3. Modificar Permisos usando `chmod` con Modo Numérico
Cambia los permisos del `archivo1.txt` para que sólo `usuario1` pueda leer y escribir (permisos `rw-`), el grupo pueda leer (permisos `r--`) y nadie más pueda hacer nada.

```bash
chmod 640 ~/archivo1.txt
```

### 4. Modificar Permisos usando `chmod` con Modo Simbólico
Agrega permiso de ejecución al propietario del `archivo2.txt`.

```bash
chmod u+x ~/directorio1/archivo2.txt
```

### 5. Cambiar el Grupo Propietario
Cambia el grupo propietario de `archivo2.txt` a `grupo1`.

```bash
chown :grupo1 ~/directorio1/archivo2.txt
```

### 6. Configurar Permisos de Directorio
Cambia los permisos del `directorio1` para que sólo el propietario pueda entrar (permisos `rwx`), el grupo pueda listar contenidos pero no entrar (permisos `r--`), y otros no puedan hacer nada.

```bash
chmod 740 ~/directorio1
```

### 7. Comprobación de Acceso
Intenta acceder al `archivo1.txt` y `directorio1/archivo2.txt` como `usuario2`. Nota cómo el permiso de directorio afecta el acceso a los archivos dentro de él.

```bash
# Cambiar a usuario2
su - usuario2

# Intentar acceder al archivo
cat /home/usuario1/archivo1.txt

# Intentar acceder al directorio y archivo dentro de él
ls /home/usuario1/directorio1
cat /home/usuario1/directorio1/archivo2.txt
```

**Resultado esperado:**

```bash
cat: /home/usuario1/archivo1.txt: Permiso denegado
ls: cannot open directory '/home/usuario1/directorio1': Permiso denegado
```

### 8. Verificación Final
Verifica los permisos y propietario de los archivos y directorio nuevamente con `ls -l` y `ls -ld`.

```bash
# Cambiar de nuevo a usuario1 para verificar
su - usuario1

ls -l ~/archivo1.txt
ls -ld ~/directorio1
ls -l ~/directorio1/archivo2.txt
```

**Resultado final:**

```bash
-rw-r----- 1 usuario1 usuario1 20 ago  4 12:00 archivo1.txt
drwxr----- 2 usuario1 usuario1 4096 ago  4 12:05 directorio1
-rwxr--r-- 1 usuario1 grupo1   24 ago  4 12:10 directorio1/archivo2.txt
```

---

## Reflexión (Opcional)

1. **¿Por qué es importante gestionar correctamente los usuarios y permisos en un sistema operativo?**

   Gestionar correctamente los usuarios y permisos es crucial para mantener la seguridad y privacidad de los datos en un sistema operativo. Esto previene accesos no autorizados a información sensible y asegura que sólo las personas adecuadas tengan control sobre los recursos del sistema.

2. **¿Qué otros comandos o técnicas conocen para gestionar permisos en Linux?**

   Algunos otros comandos y técnicas para gestionar permisos en Linux incluyen:

   - `chown`: Para cambiar el propietario y grupo de archivos y directorios.
   - `chmod`: Para modificar permisos de archivos y directorios.
   - `setfacl` y `getfacl`: Para establecer y obtener listas de control de acceso (ACL) para permisos más granulares.
   - `umask`: Para definir los permisos por defecto para nuevos archivos y directorios.

