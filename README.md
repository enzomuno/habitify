# 📊 Habitify Data Pipeline

Este projeto é um pipeline de dados completo para extrair, transformar e analisar os dados do [Habitify](https://docs.habitify.me/), uma plataforma de hábitos e produtividade. Utilizo esse app para registrar os progressos e me lembrar de meus hábitos.

---

## 🔧 Tecnologias Utilizadas

- **Python**: Para scripts de ingestão da API do Habitify
- **PostgreSQL (Neon)**: Armazenamento em nuvem dos dados brutos
- **dbt**: Transformações em camadas (`stg`, `core`, `mart`)
- **GitHub Actions**: Orquestração e agendamento automático do pipeline
- **SQL**: Modelagem analítica

---

## 🧠 Arquitetura do Projeto

