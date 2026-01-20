# 플러그인 개발 가이드

이 문서는 cc-marketplace에 새 플러그인을 추가하는 방법을 설명합니다.

## 플러그인 구조

각 플러그인은 `plugins/` 폴더 아래 독립적인 디렉토리로 구성됩니다:

```
plugins/my-plugin/
├── plugin.json          # 필수: 플러그인 메타데이터
├── README.md            # 권장: 플러그인 문서
├── commands/            # 선택: 슬래시 명령어
│   └── *.md
├── agents/              # 선택: 에이전트 정의
│   └── *.md
├── hooks/               # 선택: 훅 정의
│   └── *.md
├── skills/              # 선택: 스킬 정의
│   └── *.md
└── templates/           # 선택: 템플릿 파일
    └── *.md
```

## plugin.json 작성

```json
{
  "name": "my-plugin",
  "version": "1.0.0",
  "description": "플러그인 설명",
  "author": "작성자 이름",
  "commands": [
    "commands/my-command.md"
  ],
  "agents": [
    "agents/my-agent.md"
  ],
  "hooks": [
    "hooks/my-hook.md"
  ],
  "settings": {
    "option_name": {
      "type": "string",
      "default": "value",
      "description": "옵션 설명"
    }
  }
}
```

## marketplace.json 등록

`.claude-plugin/marketplace.json`의 `plugins` 배열에 추가:

```json
{
  "name": "my-plugin",
  "source": "./plugins/my-plugin",
  "description": "플러그인 설명 (한글 가능)",
  "version": "1.0.0",
  "author": {
    "name": "작성자",
    "url": "https://github.com/username"
  },
  "keywords": ["keyword1", "keyword2"],
  "category": "productivity"
}
```

### 카테고리 목록

| Category | 설명 |
|----------|------|
| `productivity` | 생산성 도구 |
| `content-creation` | 콘텐츠 생성 |
| `development` | 개발 도구 |
| `documentation` | 문서화 |
| `platform` | 플랫폼 통합 |
| `utility` | 유틸리티 |

## 빠른 시작

### 자동 생성 스크립트 사용

```bash
./scripts/create-plugin.sh my-new-plugin
```

이 스크립트는 다음을 자동으로 수행합니다:
1. `plugins/my-new-plugin/` 폴더 생성
2. 기본 `plugin.json` 생성
3. `commands/`, `agents/`, `hooks/` 폴더 생성
4. `README.md` 템플릿 생성
5. `marketplace.json`에 플러그인 등록

### 수동 생성

1. 플러그인 폴더 생성:
   ```bash
   mkdir -p plugins/my-plugin/{commands,agents,hooks}
   ```

2. `plugin.json` 작성

3. `marketplace.json`에 등록

## 명령어 작성 예시

`commands/hello.md`:

```markdown
---
name: hello
description: 인사 명령어
---

사용자에게 인사합니다.

## 사용법

/hello [이름]

## 동작

1. 이름이 주어지면 해당 이름으로 인사
2. 이름이 없으면 기본 인사
```

## 에이전트 작성 예시

`agents/helper.md`:

```markdown
---
name: helper
description: 도움 에이전트
tools:
  - Read
  - Grep
  - Glob
---

사용자의 질문에 답변하는 에이전트입니다.

## 역할

- 코드베이스 탐색
- 질문 답변
```

## 훅 작성 예시

`hooks/pre-commit.md`:

```markdown
---
name: pre-commit
event: PreToolUse
matchTools:
  - Bash
matchPatterns:
  - git commit
---

커밋 전 검증을 수행합니다.
```

## 테스트

플러그인 개발 후 로컬에서 테스트:

```bash
# 마켓플레이스 로컬 추가
/plugin marketplace add /path/to/cc-marketplace

# 플러그인 설치
/plugin install my-plugin@dave-cc-plugins --scope local
```

## 배포

1. 변경사항 커밋
2. GitHub에 푸시
3. 사용자는 마켓플레이스 추가 후 플러그인 설치 가능
