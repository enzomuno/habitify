import requests
import pandas as pd
from src.config import get_api_key
from src.extract.utils import to_iso8601_21, to_iso8601_23, today


API_KEY = get_api_key()
URL_BASE = "https://api.habitify.me/"
HEADERS = {
            "Authorization":API_KEY
}


# Definir as datas para rodar o código (Sempre será a data que o código está rodando)
actual_date_23 = to_iso8601_23()
actual_date_21 = to_iso8601_21()


# ====FUNÇÃO PARA TRATAR ERROS HTTPS====
def handle_request_errors(response):
    if response.status_code != 200:
        raise Exception(f"Erro ao consultar API: {response.status_code} - {response.text}")
    return response.json()['data']

# ====FUNCAO PARA OBTER AS ÁREAS CADASTRADAS====
def get_areas_habitify():
    url_endpoint = f"{URL_BASE}areas"

    try:
        response =  requests.get(url=url_endpoint, headers=HEADERS)
        return handle_request_errors(response)
    except requests.exceptions.RequestException as e:
        print(f"Erro na requisição: {e}")
        return None

# ====FUNCAO PARA OBTER OS REGISTROS DE 'MOODS' NO DIA====
def get_moods_habitify():
    url_endpoint = f"{URL_BASE}moods"
    params = {"target_date":actual_date_21}

    try:
        response = requests.get(url=url_endpoint, headers=HEADERS, params=params)
        return handle_request_errors(response)
    except requests.exceptions.RequestException as e:
        print(f"Erro na requisição: {e}")
        return None

# ====EM IMPLEMENTAÇÃO====

def get_habits_id():
    habits_id = []
    response = requests.get(url=f"{URL_BASE}habits", headers=HEADERS).json()
    
    for i in response['data']:
        habits_id.append(i["id"])

    return habits_id



# ====FUNCAO PARA OBTER OS REGISTROS DE 'MOODS' NO DIA====
def get_notes_habitify():
    all_notes = []
    habits = get_habits_id()

    for habit_id in habits:
        url_endpoint = f"{URL_BASE}notes/{habit_id}"
        params = {
            "from": f"{today}T00:00:01-03:00",
            "to": f"{today}T23:59:59-03:00"
        }

        try:
            response = requests.get(url=url_endpoint, headers=HEADERS, params=params)
            notes = handle_request_errors(response)

            if notes:  # só adiciona se houver notas
                all_notes.extend(notes)

        except requests.exceptions.RequestException as e:
            print(f"Erro na requisição para hábito {habit_id}: {e}")
            continue

    return all_notes


# ====FUNCAO PARA OBTER TODOS OS 'HABITS' CADASTRADOS====
def get_habits_habitify():
    url_endpoint = f"{URL_BASE}habits"

    try:
        response = requests.get(url=url_endpoint, headers=HEADERS)
        return handle_request_errors(response)
    except requests.exceptions.RequestException as e:
        print(f"Erro na requisição: {e}")
        return None

# ====FUNCAO PARA OBTER TODOS OS 'JOURNAL' DE LOGS NO DIA====
def get_journal_habitify():
    url_endpoint = f"{URL_BASE}journal"
    params = {"target_date":actual_date_23}

    try:
        response = requests.get(url=url_endpoint, headers=HEADERS, params=params)
        return handle_request_errors(response)
    except requests.exceptions.RequestException as e:
        print(f"Erro na requisição: {e}")
        return None