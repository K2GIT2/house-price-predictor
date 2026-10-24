FROM python:3.9-slim

WORKDIR /app

# 1. 依存関係のファイルだけを先にコピーしてインストール（キャッシュを効かせる）
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 2. 残りのソースコードをコピー
COPY app.py .

# 3. 起動コマンド（uvicornのスペルミスを修正）
EXPOSE 8501
CMD ["streamlit", "run", "app.py", "--server.address=0.0.0.0"]