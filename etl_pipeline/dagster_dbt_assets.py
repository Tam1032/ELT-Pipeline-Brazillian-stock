from dagster_dbt import load_assets_from_dbt_project, DbtCliClientResource
from dagster import file_relative_path, Definitions

DBT_PROJECT_PATH = file_relative_path(__file__, "../brazillian_stock")
DBT_PROFILES = file_relative_path(__file__, "../brazillian_stock")

dbt_assets = load_assets_from_dbt_project(
    profiles_dir = DBT_PROFILES,
    project_dir = DBT_PROJECT_PATH,
    key_prefix = ["market"]
)

resources = {
    "dbt": DbtCliClientResource(
        profiles_dir = DBT_PROFILES,
        project_dir = DBT_PROJECT_PATH
    )
}

defs = Definitions(assets=dbt_assets, resources=resources)