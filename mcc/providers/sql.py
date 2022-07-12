from mcc.languages import Lang
from mcc.providers import Mccabe


class MccabePy(Mccabe):
    suffixes = (".sql",)
    language = Lang.sql
    judge_nodes = [
        "select",
        "function_call",
        "index_hint",
        "delete",
        "drop_table",
        "drop_view"
        "insert",
        "statement",
        "alter_table",
        "alter_view",
        "create_table",
        "create_materialized_view",
        "create_view",
    ]
