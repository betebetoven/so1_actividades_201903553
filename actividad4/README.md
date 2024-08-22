# Servicio de Saludo

Este servicio de `systemd` ejecuta un script que imprime un saludo y la fecha actual infinitamente con una pausa de un segundo.

## Instalación

1. Coloca el script `saludo.sh` en la siguiente ubicación:
   - `C:\Users\alber\OneDrive\Escritorio\cys\sopes\actividad4\saludo.sh`
   - Asegúrate de que tiene permisos de ejecución.

2. Crea el archivo de servicio `saludo.service` en `/etc/systemd/system/` con el siguiente contenido:

    ```ini
    [Unit]
    Description=Servicio que imprime un saludo y la fecha actual cada segundo
    After=network.target

    [Service]
    ExecStart=/C:/Users/alber/OneDrive/Escritorio/cys/sopes/actividad4/saludo.sh
    Restart=always

    [Install]
    WantedBy=multi-user.target
    ```

3. Habilita el servicio para que se inicie con el sistema:

    ```bash
    sudo systemctl enable saludo.service
    ```

4. Inicia el servicio:

    ```bash
    sudo systemctl start saludo.service
    ```

## Ver los logs del servicio

Para ver los logs del servicio, utiliza el siguiente comando:

```bash
sudo journalctl -u saludo.service
```

## Información del Proyecto

- **Nombre:** Alberto Josué Hernández Armas
- **Carnet:** 201903553
- **Curso:** Sistemas Operativos 1
