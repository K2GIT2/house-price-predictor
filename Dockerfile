FROM python:3.11-slim

WORKDIR /app

# 1. 依存関係のファイルだけを先にコピーしてインストール（キャッシュを効かせる）
COPY src/api/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 2. 残りのソースコードをコピー
COPY src/api/ .
COPY models/trained/*.pkl models/trained/

# 3. 起動コマンド（uvicornのスペルミスを修正）
EXPOSE 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]