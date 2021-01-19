require "pg"

class Database
  def initialize
    con = { host: "192.168.99.100", dbname: "nflix", user: "postgres", password: "qaninja" }
    @connection = PG.connect(con)
  end

  def clean_db
    @connection.exec("DELETE FROM public.users WHERE id > 1;")
  end

  def find_user(email)
    query = "SELECT id, full_name, password, email, created_at, updated_at" \
    " FROM public.users WHERE email = '#{email}';"
    @connection.exec(query).first
  end

  def delete_user(email)
    @connection.exec("DELETE from public.users where email = '#{email}';")
  end
end
