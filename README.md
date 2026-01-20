# Claude Code RAG Plugin

> RAG 기반 지식 관리 플러그인 - 작업 내역, 솔루션, 분석을 벡터 DB에 저장하여 재사용

[![Plugin](https://img.shields.io/badge/Claude_Code-Plugin-blue.svg)](https://github.com/s1ckdark/oh-my-claude-rag)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

## 설치

```bash
# 마켓플레이스 추가
/plugin marketplace add s1ckdark/oh-my-claude-rag

# 플러그인 설치
/plugin install claude-code-rag@oh-my-claude-rag --scope project
```

## 설정

### 벡터 DB 선택

| 옵션 | 장점 | 설정 방법 |
|------|------|----------|
| **Pinecone** (기본) | 관리 불필요, 확장성 | `PINECONE_API_KEY` 환경변수 |
| **Chroma** (로컬) | 무료, 프라이버시 | Docker 실행 필요 |
| **MongoDB Atlas** | 익숙함, 메타데이터 쿼리 | `MONGODB_URI` 환경변수 |

### Pinecone 설정 (권장)

Claude Code에 Pinecone MCP가 기본 내장되어 있습니다.

1. [Pinecone](https://pinecone.io)에서 API 키 발급
2. `~/.claude/settings.json`에 API 키 설정:
   ```json
   {
     "env": {
       "PINECONE_API_KEY": "your-api-key"
     }
   }
   ```
3. 인덱스 생성: `/pinecone quickstart` 실행 또는 콘솔에서 직접 생성

## 사용법

### `/claude-code-rag:save` - 작업 저장

현재 작업 내역을 구조화된 문서로 저장

```
/claude-code-rag:save --type bugfix --tags "auth,session" --title "세션 타임아웃 수정"
```

**인자:**
- `--type`: 작업 유형 (bugfix, feature, refactor, analysis)
- `--title`: 문서 제목 (자동 생성 가능)
- `--tags`: 태그 (쉼표 구분)
- `--namespace`: 프로젝트 네임스페이스

### `/claude-code-rag:search` - 지식 검색

과거 작업과 솔루션 검색

```
/claude-code-rag:search "session timeout error"
/claude-code-rag:search "authentication" --type bugfix --limit 3
```

### `/claude-code-rag:index` - 일괄 인덱싱

로컬 마크다운 문서 일괄 저장

```
/claude-code-rag:index
/claude-code-rag:index --path ./docs/knowledge --namespace my-project
```

## 프로젝트 구조

```
oh-my-claude-rag/
├── .claude-plugin/
│   └── plugin.json          # 플러그인 메타데이터
├── commands/                # 슬래시 명령어
│   ├── save.md
│   ├── search.md
│   ├── index.md
│   └── analyze.md
├── agents/                  # 에이전트 정의
│   ├── documenter.md
│   └── codebase-analyzer.md
├── hooks/
│   ├── hooks.json
│   └── auto-document.md
├── templates/               # 문서 템플릿
│   ├── bugfix.md
│   ├── feature.md
│   ├── refactor.md
│   └── analysis.md
├── .mcp.json               # MCP 서버 설정
└── README.md
```

## 토큰 절감 효과

| 상황 | Before | After |
|------|--------|-------|
| 동일 버그 재발생 | 전체 코드 재분석 | 과거 솔루션 즉시 검색 |
| 아키텍처 질문 | 매번 탐색 | 저장된 분석 재사용 |
| 패턴 반복 | 새로 작성 | 템플릿 활용 |

## 라이선스

MIT
