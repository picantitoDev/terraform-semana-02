# Load Balancing con NGINX y uso de Ansible para configuración

## 👥 Grupo e Integrantes

**Grupo:** 5

**Integrantes:**
- ALCANTARA RODRIGUEZ, PIERO
- BAUTISTA REYES, LOURDES
- DAVALOS ALFARO, MARISELLA
- LEYVA VALQUI,GABRIEL
- RODRIGUEZ GONZALES, ALEJANDRO

## 📋 Descripción

Este repositorio define una infraestructura local con Terraform y Docker compuesta por:

* **Nginx**: tres instancias funcionand como web servers y una instancia funcionando como Load Balancer
* **PostgreSQL**: base de datos en red de persistencia
* **Redis**: caché en red de persistencia (sin volúmenes)
* **Grafana**: monitoreo conectado a múltiples redes.

## 🐳Imágenes Docker Utilizadas

| Servicio | Imagen | Justificación |
|----------|--------|---------------|
| **Nginx** | nginx:stable-alpine3.21-perl | Versión estable con soporte Perl para funcionalidades. |
| **PostgreSQL** | postgres:15-alpine | Versión LTS con Alpine para menor consumo de recursos. |
| **Redis** | redis:7.4.1-alpine | Versión estable y ligera, Alpine reduce el tamaño de imagen. |
| **Grafana** | grafana/grafana-enterprise:9.4.7 | Versión Enterprise con funcionalidades adicionales de monitoreo. |

## 🚀 Instrucciones de Uso

### 1. Clonar el repositorio
```bash
git clone git@github.com:picantitoDev/terraform-semana-02.git
cd terraform-semana-02
```

### 2. Provisionamiento
```bash

# Directorio de infraestructura
cd /iac

# Inicializar terraform
terraform init

# Ver plan de ejecución
terraform plan

# Aplicar infraestructura
terraform apply --auto-approve

# Verificar contenedores
docker ps
```

### 3. Configuración
```bash

# Directorio de configuración
cd ../config

# Aplicar configuraciones con Ansible
sudo ansible-playbook -i inventory.ini playbook.yaml
```

### 4. Resultados
```bash
# Visitar la siguiente URL
http://localhost:8080

# Si deseamos borrar los recursos (en /iac)
terraform destroy
```


## 🔌 Justificación de Puertos

| Servicio | Puerto | Justificación |
|----------|--------|---------------|
| **Nginx (Proxy)** | 8080 | El puerto 8080 se utiliza frecuentemente como alternativa al puerto 80 en servidores web y de aplicaciones, incluyendo instancias de NGINX. Esta práctica permite evitar conflictos con el puerto HTTP predeterminado (80), que puede estar ocupado por otros servicios o reservado para otra instancia en el host. |
| **PostgreSQL** | 5432 | Puerto estándar de PostgreSQL. |
| **Redis** | 6379 | Puerto por defecto de Redis. |
| **Grafana** | 3000 | Puerto por defecto de Grafana. |

## 💾 Consideraciones de Storage

**Redis sin volúmenes:** No se utilizan volúmenes en Redis porque se especificó en clase que es únicamente para caching, por lo que no importa perder datos en el reinicio del contenedor.

## 🔧 Problemas Durante el Desarrollo

### Configuración de Redes
- **Problema:** Contenedores no se comunicaban entre capas
- **Solución:** Definir redes separadas (`app_net`, `persistence_net`, `monitor_net`)

## 🌐 Acceso a Servicios

- **Nginx (Proxy):** http://localhost:8080
