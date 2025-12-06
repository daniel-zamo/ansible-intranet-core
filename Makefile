.PHONY: setup deploy clean check

# Entorno virtual y Python
VENV := .venv
PYTHON := $(VENV)/bin/python3
PIP := $(VENV)/bin/pip
ANSIBLE := $(VENV)/bin/ansible-playbook
GALAXY := $(VENV)/bin/ansible-galaxy

# Inicializar entorno (Solo se ejecuta una vez o si borras .venv)
setup:
	python3 -m venv $(VENV)
	$(PIP) install --upgrade pip
	$(PIP) install ansible-core ansible-lint docker
	$(GALAXY) install -r requirements.yml --force
	@echo "✅ Entorno listo. Ejecuta 'make deploy' para lanzar."

# Ejecutar el despliegue
deploy:
	$(ANSIBLE) playbook/deploy-lamp.yml

# Verificar sintaxis antes de ejecutar
check:
	$(VENV)/bin/ansible-lint playbook/deploy-lamp.yml

# Limpiar entorno
clean:
	rm -rf $(VENV) collections/ansible_collections
