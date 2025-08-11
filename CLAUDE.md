# Crack Site - Rails Application

## Project Overview
Ruby on Rails 8.0.2 애플리케이션으로 Post 관리 시스템을 제공합니다. 사용자는 게시글을 작성하고 첨부파일을 업로드할 수 있으며, 관리자 대시보드도 포함되어 있습니다.

## Setup & Running
- 설치: `bundle install`
- 데이터베이스 설정: `rails db:create db:migrate db:seed`
- 개발 서버 실행: `rails server`
- 테스트 실행: `rails test`
- 린트 실행: `rubocop`
- 보안 검사: `brakeman`

## Architecture
- **Rails 8.0.2** 기반
- **데이터베이스**: SQLite3
- **웹서버**: Puma
- **스타일링**: Tailwind CSS
- **자바스크립트**: Import maps
- **캐싱**: Solid Cache, Solid Queue, Solid Cable
- **파일 저장**: Active Storage

### 주요 디렉토리 구조
```
app/
├── controllers/
│   ├── admin/           # 관리자 컨트롤러
│   └── posts_controller.rb
├── models/
│   └── post.rb         # Post 모델 (첨부파일 지원)
├── views/
│   ├── admin/          # 관리자 뷰
│   └── posts/          # 게시글 뷰
└── assets/
    ├── stylesheets/
    └── javascript/
```

## Models
- **Post**: 제목 검증, 다중 첨부파일 지원 (has_many_attached :attachments)

## Routes
- 루트: `posts#index`
- Posts CRUD: `/posts`
- 첨부파일 삭제: `DELETE /posts/:id/remove_attachment`
- 관리자: `/admin/posts`, `/admin` (dashboard)
- 헬스체크: `/up`

## Development Notes
- Rails 8의 새로운 기능 사용 (Solid 시리즈)
- Active Storage로 파일 업로드 처리
- 관리자와 일반 사용자 인터페이스 분리
- Tailwind CSS로 스타일링
- Docker 컨테이너 배포 준비 (Kamal)

## Common Commands
- `rails generate controller ControllerName`
- `rails generate model ModelName`
- `rails db:migrate`
- `rails console`
- `rails routes`

## Security
- Brakeman을 사용한 보안 취약점 검사
- 파일 업로드 보안 검토 필요
- CSRF 보호 활성화됨