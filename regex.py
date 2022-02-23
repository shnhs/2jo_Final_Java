def regex(df_news_data):
    """
    뉴스 데이터 헤드라인의 [문자열] 등 형태와 같이 
    분석과 상관없는 특수문자 및 문자열, 즉 정규표현식을 찾아 제거하는 전처리 함수
    """

    import re
    import pandas as pd

    # news_data_preprocessing.csv : 2.7GB, 8,059,304 rows

    df_news_data = pd.read_csv("news_data_preprocessing.csv")

    remove = r'\[[^)]*\]' or r'\([^)]*\)' or r'\<[^)]*\>' or r'\(^[0-9]*$)'
    for i in range(len(df_news_data)):
        df_news_data['제목'][i] = re.sub(remove, '', df_news_data['제목'][i])
    return(df_news_data)

    # 이후 to_csv 변환
    # df_news_data.to_csv("news_data.csv")
