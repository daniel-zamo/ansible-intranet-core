# 🏢 Infraestructura Intranet Core (LAMP)

<!-- BADGES START -->
![Ansible](https://img.shields.io/badge/ansible-%231A1918.svg?style=for-the-badge&logo=ansible&logoColor=white)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![PHP](https://img.shields.io/badge/php-%23777BB4.svg?style=for-the-badge&logo=php&logoColor=white)
![Status](https://img.shields.io/badge/STATUS-STABLE-green?style=for-the-badge)
![License](https://img.shields.io/badge/license-MIT-blue?style=for-the-badge)
<!-- BADGES END -->

> **Proyecto:** Despliegue automatizado del stack base para la Intranet Corporativa.  
> **Estado:** 🟢 Estable (v1.0).

Este repositorio contiene la Infraestructura como Código (IaC) necesaria para aprovisionar el servidor de aplicaciones `intranet-core`. Utiliza un enfoque de contenedores efímeros con persistencia de datos y una imagen PHP personalizada.

---

## 🏗️ Arquitectura

El despliegue orquesta los siguientes componentes en el host remoto:

1. **Red:** `intranet-core-net` (Bridge aislado).
2. **Base de Datos:** MariaDB 10.6 con persistencia en volumen Docker.
3. **Backend/Frontend:** Apache + PHP 8.1 (Imagen Custom construida *in-situ* con soporte `mysqli`).
4. **Código:** Inyección de código fuente desde `./src` local hacia `/opt/intranet-core/html` remoto.

## 📂 Estructura del Proyecto

```text
ansible-intranet-core/
├── Makefile              # 🛠️ Orquestador de tareas (Setup & Deploy)
├── ansible.cfg           # Configuración del motor (Callback 'default')
├── requirements.yml      # Dependencias (Docker & Posix)
├── inventory/            # Definición de hosts (SSH)
├── group_vars/
│   └── all.yml           # ⚙️ Variables Globales y Secretos
├── playbook/             # Lógica principal del despliegue
├── src/                  # Código fuente de la aplicación (PHP)
└── Dockerfile            # Receta para la imagen PHP custom
```

## 🚀 Flujo de Trabajo Estándar

Este proyecto utiliza **Make** para garantizar la consistencia del entorno.

### 1. Inicialización (Setup)

Ejecutar una única vez al clonar el repo.

```bash
make setup
```

### 2. Despliegue (Deploy)

Lanza el playbook contra el entorno de desarrollo.

```bash
make deploy
```

### 3. Verificación (Check)

Valida la sintaxis del código (Linting).

```bash
make check
```

---

## ⚙️ Configuración

Las variables principales (nombres, rutas, credenciales) se encuentran centralizadas en:  
`group_vars/all.yml`

⚠️ **Seguridad:** En entornos productivos, utilizar **Ansible Vault** para cifrar este archivo.

## 📚 Referencias

* **Normativa Interna:** SOP-LINUX-ANS-01 (Setup Ansible Core).
* **Ansible Docs:** [Community Docker Collection](https://docs.ansible.com/ansible/latest/collections/community/docker/).
* **Docker Docs:** [PHP Official Image](https://hub.docker.com/_/php).

## 📄 Licencia

Este proyecto está bajo la Licencia **MIT**. Consulta el archivo [LICENSE](LICENSE) para más detalles.
