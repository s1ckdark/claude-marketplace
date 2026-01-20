# oh-my-claude-rag Development Guide

Claude Code RAG 플러그인 개발 가이드입니다.

## 플러그인 구조

```
plugins/claude-code-rag/
├── plugin.json          # 플러그인 메타데이터
├── commands/            # 슬래시 명령어
│   ├── save.md
│   ├── search.md
│   └── index.md
├── agents/              # 에이전트 정의
│   ├── documenter.md
│   └── codebase-analyzer.md
├── hooks/               # 훅 정의
│   └── hooks.json
└── templates/           # 템플릿 파일
```

## 주요 파일

### plugin.json

플러그인 메타데이터와 구성 요소를 정의합니다.

### Commands

- `save.md` - 현재 작업을 벡터 DB에 저장
- `search.md` - 저장된 지식 검색
- `index.md` - 프로젝트 문서 벌크 인덱싱

### Agents

- `documenter.md` - 대화 분석 및 문서 생성
- `codebase-analyzer.md` - 코드베이스 분석 및 인덱싱

## 테스트

```bash
# 로컬 마켓플레이스로 테스트
/plugin marketplace add /path/to/oh-my-claude-rag
/plugin install claude-code-rag@oh-my-claude-rag --scope local
```

## 배포

1. 변경사항 커밋
2. GitHub에 푸시
3. 사용자는 마켓플레이스 추가 후 플러그인 설치 가능
