# ====IMPORT DAS BIBLIOTECAS====
from dotenv import load_dotenv
import os

load_dotenv()

# ====FUNCAO PARA OBTER A CHAVE DA API DO HABITIFY====
def get_api_key():
    return os.getenv('API_KEY')


# ====FUNCAO PARA OBTER AS VARIAVEIS DO BANCO DE DADOS====
def get_db_conn():
    db_user = os.getenv("DB_USER_PROD")
    db_password = os.getenv("DB_PASSWORD_PROD")
    db_host = os.getenv("DB_HOST_PROD")
    db_port = os.getenv("DB_PORT_PROD", "5432")  # padrão se não estiver no .env
    db_name = os.getenv("DB_NAME_PROD")
    db_ssl_mode = os.getenv("DB_SSL_MODE_PROD", "require")

    return f"postgresql://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}?sslmode={db_ssl_mode}"