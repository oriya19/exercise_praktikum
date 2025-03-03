def change_date(date):
    months_map = {
        1: "תשרי",
        2: "חשוון",
        3: "כסלו",
        4: "טבת",
        5: "שבט",
        6: "אדר",
        7: "ניסן",
        8: "אייר",
        9: "סיון",
        10: "תמוז",
        11: "אב",
        12: "אלול"
    }
    day = date.day
    month = date.month
    year = date.year
    hebrew_month = months_map.get(month, "חודש לא קיים")

    return f"{day} {hebrew_month} {year}"