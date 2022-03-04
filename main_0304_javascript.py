import pandas as pd
from datetime import datetime
import time
from collections import OrderedDict
from flask import Flask, jsonify, make_response, render_template, request
import sqlite3
import json

app = Flask(__name__)


print('솔트룩스 2조 파이널 프로젝트 입니다.')


def select_sqlite(stock, startdate, enddate):
    global daylist
    con = sqlite3.connect('final.db')
    cur = con.cursor()

    defaultquery = """
    select      s_date, open, high, low, close, volume
    from        stock_db 
    where       s_code = ? 
    and         s_date 
    between     ? and ?
    """
    
    cur.execute(defaultquery, (stock, startdate, enddate))
    daylist = list(cur.fetchall())

    df = pd.DataFrame(daylist)

    a = df[0][0]
    a = str(a)
    s = datetime.strptime(a, "%Y%m%d")
    print(len(df[0]))
    for a in range(len(df[0])):
        df[0][a] = str(df[0][a])
        s = datetime.strptime(str(df[0][a]), "%Y%m%d")
        df[0][a] = int(time.mktime(s.timetuple()))*1000

    daylist=df.values.tolist()
    return daylist


def show_candle():
    """
    단순 값 리턴
    """
    global daylist
    con = sqlite3.connect('final.db')
    cur = con.cursor()

    defaultquery = """
    select      s_date, open, high, low, close, volume
    from        stock_db 
    """
    
    cur.execute(defaultquery)
    daylist = list(cur.fetchall())
    return daylist


def show_candle_datetime():
    """
    datetime 계산되서 날짜형식으로 출력하는 함수
    """
    global daylist
    con = sqlite3.connect('final.db')
    cur = con.cursor()

    defaultquery = """
    select      s_date, open, high, low, close, volume
    from        stock_db 
    """
    
    cur.execute(defaultquery)
    daylist = cur.fetchall()

    daylist=sql_to_systemtime(daylist)
    return daylist


def sql_to_systemtime(query_result):
    df = pd.DataFrame(query_result)

    a = df[0][0]
    a = str(a)
    s = datetime.strptime(a, "%Y%m%d")
    print(len(df[0]))

    for a in range(len(df[0])):
        df[0][a] = str(df[0][a])
        s = datetime.strptime(str(df[0][a]), "%Y%m%d")
        df[0][a] = int(time.mktime(s.timetuple()))*1000
    query_result=df.values.tolist()

    return query_result


@app.route("/go", methods=["POST"])
# @app.route("/data.json", methods=['GET'])
def java_conn():

    print('요청하는 방식 : ', request.method)
    global stock, startdate, enddate, news_period,day, answer
    test_dict=OrderedDict()

    if request.method == 'POST':
        stock = request.form.get("stock")
        startdate = request.form.get("startdate")
        enddate = request.form.get("enddate")
        news_period = request.form.get("day")

        print('받아오기 성공 : ',stock, startdate, enddate, news_period)

        answer=select_sqlite(stock, startdate, enddate)
        print('answer 출력 : ', answer)

        test_dict['s_code']=stock
        # test_dict['start_date']=startdate
        # test_dict['end_date']=enddate
        test_dict['stock_data']=answer

        print('test_dict 출력하기: ',test_dict)

        response = make_response(json.dumps(dict(test_dict), ensure_ascii=False)) 
        response.headers.add("Access-Control-Allow-Origin", "*")

        print(response)

    return response
    
if __name__ == '__main__':
    app.debug = True
    app.run()