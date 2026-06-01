# 📝 Mini Note API

A lightweight, RESTful API-only application built with **Ruby 3.3.0** and **Rails 7.2** to demonstrate core backend engineering and data processing concepts.

## 🚀 Key Features
- 🔐 **JWT Authentication:** Secure, stateless endpoint protection via token headers.
- 🗜 **Serializers:** Optimized JSON payloads using `active_model_serializers`.
- 🔍 **Filtering & Pagination:** Server-side search (`ILIKE`) and custom `limit`/`offset` handling.
- 🧪 **Automated Testing:** Request specs built with **RSpec** to validate API responses.
- 📖 **API Docs:** Interactive API playground using **Swagger UI** (`rswag`).

## 🛠 Tech Stack
- **Framework:** Ruby on Rails 7.2 (API mode)
- **Database:** PostgreSQL
- **Testing & Docs:** RSpec, Rswag

## 💻 Quick Start
```bash
# Setup database
rails db:create
rails db:migrate

# Run tests
bundle exec rspec

# Start server
rails s
# Access Swagger UI at: http://localhost:3000/api-docs
