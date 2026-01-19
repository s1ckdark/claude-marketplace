# Claude Code RAG Plugin

RAG 기반 지식 관리 플러그인 - 작업 내역, 솔루션, 분석을 벡터 DB에 저장하여 재사용

## 설치

```bash
# 플러그인 디렉토리에 클론 또는 복사
cp -r claude-code-rag ~/.claude/plugins/
```

## 설정

### 벡터 DB 선택

| 옵션 | 장점 | 설정 방법 |
|------|------|----------|
| **Pinecone** (기본) | 관리 불필요, 확장성 | `PINECONE_API_KEY` 환경변수 |
| **Chroma** (로컬) | 무료, 프라이버시 | Docker 실행 필요 |
| **MongoDB Atlas** | 익숙함, 메타데이터 쿼리 | `MONGODB_URI` 환경변수 |

### Pinecone 설정 (권장)

1. [Pinecone](https://pinecone.io)에서 API 키 발급
2. 환경변수 설정:
   ```bash
   export PINECONE_API_KEY="your-api-key"
   ```
3. 인덱스 자동 생성됨: `claude-code-rag`

### Chroma 설정 (로컬)

1. Docker로 Chroma 실행:
   ```bash
   docker run -d --name chroma -p 8000:8000 \
     -v ~/chroma-data:/chroma/chroma chromadb/chroma
   ```
2. `.mcp.json`에서 chroma 활성화, pinecone 비활성화

### MongoDB Atlas 설정

1. MongoDB Atlas 클러스터 생성
2. Vector Search 인덱스 설정
3. 환경변수 설정:
   ```bash
   export MONGODB_URI="mongodb+srv://..."
   ```
4. `.mcp.json`에서 mongodb 활성화

## 사용법

### `/rag-save` - 작업 저장

현재 작업 내역을 구조화된 문서로 저장

```
/rag-save --type bugfix --tags "auth,session" --title "세션 타임아웃 수정"
```

**인자:**
- `--type`: 작업 유형 (bugfix, feature, refactor, analysis)
- `--title`: 문서 제목 (자동 생성 가능)
- `--tags`: 태그 (쉼표 구분)
- `--namespace`: 프로젝트 네임스페이스

### `/rag-search` - 지식 검색

과거 작업과 솔루션 검색

```
/rag-search "session timeout error"
/rag-search "authentication" --type bugfix --limit 3
```

**인자:**
- `query`: 검색 쿼리 (필수)
- `--limit`: 결과 개수 (기본 5)
- `--type`: 유형 필터
- `--namespace`: 프로젝트 필터
- `--tags`: 태그 필터

### `/rag-index` - 일괄 인덱싱

로컬 마크다운 문서 일괄 저장

```
/rag-index
/rag-index --path ./docs/knowledge --namespace my-project
```

**인자:**
- `--path`: 문서 경로 (기본 `.rag-docs/`)
- `--namespace`: 네임스페이스
- `--force`: 기존 문서 재인덱싱

## 문서 템플릿

### bugfix
```markdown
---
type: bugfix
date: 2024-01-19
tags: [auth, session]
files: [middleware.ts]
title: 세션 버그 수정
---
# 증상 / 원인 / 해결 / 방지
```

### feature
```markdown
---
type: feature
...
---
# 요구사항 / 설계 / 구현 / 테스트
```

### refactor
```markdown
---
type: refactor
...
---
# 동기 / Before / After / 검증
```

### analysis
```markdown
---
type: analysis
...
---
# 질문 / 분석 과정 / 결론
```

## 자동 문서화

`auto_save` 설정 활성화 시, 세션 종료 시 자동으로 문서화 제안

```json
// plugin.json settings
{
  "auto_save": true
}
```

## 프로젝트 구조

```
claude-code-rag/
├── plugin.json          # 플러그인 메타데이터
├── .mcp.json            # MCP 서버 설정
├── commands/
│   ├── save.md          # /rag-save
│   ├── search.md        # /rag-search
│   └── index.md         # /rag-index
├── agents/
│   └── documenter.md    # 문서화 에이전트
├── hooks/
│   └── auto-document.md # 자동 문서화 훅
└── templates/
    ├── bugfix.md
    ├── feature.md
    ├── refactor.md
    └── analysis.md
```

## 데이터 백업

### Pinecone
- 클라우드 자동 백업

### Chroma
```bash
cp -r ~/chroma-data ~/chroma-backup-$(date +%Y%m%d)
```

## 토큰 절감 효과

| 상황 | Before | After |
|------|--------|-------|
| 동일 버그 재발생 | 전체 코드 재분석 | 과거 솔루션 즉시 검색 |
| 아키텍처 질문 | 매번 탐색 | 저장된 분석 재사용 |
| 패턴 반복 | 새로 작성 | 템플릿 활용 |

## 라이선스

MIT
