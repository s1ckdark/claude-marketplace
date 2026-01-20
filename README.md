# oh-my-claude-rag

> Claude Code를 위한 RAG 기반 지식 관리 플러그인

[![Plugin](https://img.shields.io/badge/Claude_Code-Plugin-blue.svg)](https://github.com/s1ckdark/oh-my-claude-rag)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

## 소개

작업 내역, 솔루션, 분석 결과를 벡터 DB에 저장하고 나중에 검색할 수 있는 Claude Code 플러그인입니다.

**주요 기능:**
- `/save` - 현재 작업을 벡터 DB에 저장
- `/search` - 저장된 지식 검색
- `/index` - 프로젝트 문서 인덱싱

**지원 벡터 DB:** Pinecone, Chroma, MongoDB

## 설치

### 1단계: 마켓플레이스 추가

```bash
/plugin marketplace add s1ckdark/oh-my-claude-rag
```

### 2단계: 플러그인 설치

```bash
/plugin install claude-code-rag@oh-my-claude-rag --scope project
```

> **Scope 옵션:**
>
> | Scope     | 설명                                   |
> | --------- | -------------------------------------- |
> | `user`    | 본인만 사용 (기본값)                   |
> | `project` | 저장소의 모든 협업자가 사용 **(권장)** |
> | `local`   | 본인만, 이 저장소에서만 사용           |

## 구조

```
oh-my-claude-rag/
├── .claude-plugin/
│   └── marketplace.json      # 플러그인 레지스트리
├── plugins/
│   └── claude-code-rag/      # 플러그인 소스
│       ├── plugin.json
│       ├── commands/
│       ├── agents/
│       ├── hooks/
│       └── templates/
└── README.md
```

## 라이선스

MIT
