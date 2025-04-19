from src.extract.habitify_client import (
    get_areas_habitify,
    get_moods_habitify,
    get_notes_habitify,
    get_habits_habitify,
    get_journal_habitify
)
from src.load.db_loader import (
    insert_areas_raw,
    insert_moods_raw,
    insert_notes_raw,
    insert_habits_raw,
    insert_journal_raw
)

if __name__ == "__main__":
    print("Extraindo e inserindo dados do Habitify...")

    try:
        areas = get_areas_habitify()
        insert_areas_raw(areas)

        moods = get_moods_habitify()
        insert_moods_raw(moods)

        notes = get_notes_habitify()
        insert_notes_raw(notes)

        habits = get_habits_habitify()
        insert_habits_raw(habits)

        journal = get_journal_habitify()
        insert_journal_raw(journal)

        print("Todos os dados foram processados com sucesso.")

    except Exception as e:
        print(f"Ocorreu um erro durante a execução: {e}")
