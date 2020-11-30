/*
* Create database and user
*/

resource "google_sql_database" "outline_db" {

  name = var.db_name
  project = var.project_id
  instance = google_sql_database_instance.outline_db_instance.name
  
}

resource "google_sql_user" "outline_db_user" {
  
  name = var.db_user
  project = var.project_id
  password = var.db_password
  instance = google_sql_database_instance.outline_db_instance.name

}
