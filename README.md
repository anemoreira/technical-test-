# Automação Mobile/Web com Robot Framework

## Requisitos
- Python 3.10+
- Node.js 18+
- Robot Framework e Browser (Playwright)

## Instalação
```bash
python -m pip install --upgrade pip
pip install -r requirements.txt
# Inicializa Playwright para a Browser Library
rfbrowser init
```

## Execução Local
```bash
robot -d results tests
```
Relatórios gerados em `results/log.html` e `results/report.html`.

## Execução via Docker Compose
```bash
docker compose up --build
```
Relatórios em `results/` no host.

## Execução no GitHub Actions
- Workflow de testes: `.github/workflows/robot-tests.yml`
- Artefatos publicados: `results/log.html`, `results/report.html`, `results/output.xml`
- Disparo manual disponível em `workflow_dispatch` ou automático em `push` nas pastas do projeto.

## Estrutura do Projeto
- `env/` variáveis por ambiente
- `resources/common/` keywords base e utilitários
- `resources/pages/` Page Objects
- `resources/locators/` seletores centralizados
- `tests/` suítes de testes

## Variáveis
Definidas em `env/dev.robot`. Personalize `BASE_URL`, `USERNAME`, `PASSWORD` conforme o ambiente.

## Dicas de Estabilidade
- Prefira locators estáveis em `resources/locators`
- Utilize esperas dinâmicas em keywords
- Use tags para filtrar execução: `smoke`, `regression`, `login`, `admin`
