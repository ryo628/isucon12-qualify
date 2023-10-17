import sys
import sqlite3
import redis

redis = redis.Redis(host='localhost', port=6379, db=0)

# 引数として渡されたSQLiteデータベースファイル
if len(sys.argv) != 2:
    print("Usage: python script.py <sqlite_db_file>")
    sys.exit(1)

sqlite_db_file = sys.argv[1]

# SQLiteデータベースに接続
try:
    conn = sqlite3.connect(sqlite_db_file)
    cursor = conn.cursor()

    # player_scoreテーブルの内容を取得
    cursor.execute('''
   SELECT
    id,
    tenant_id,
    player_id,
    competition_id,
    score,
    MAX(row_num) AS row_num,
    created_at,
    updated_at
FROM player_score
group by competition_id, tenant_id, player_id 
    ''')
    rows = cursor.fetchall()

    if len(rows) == 0:
        print("player_scoreテーブルにデータがありません。")
    else:
        for row in rows:
            _id, tenant_id, player_id, compe_id, score, row_num, created_at, updated_at = row

            redis.set(f"{tenant_id},{compe_id},{player_id}", score)

            dictData = {player_id: row_num}
            redis.zadd(f"{tenant_id},{compe_id}", dictData)


except sqlite3.Error as e:
    print(f"SQLiteエラー: {e}")
finally:
    if conn:
        conn.close()
