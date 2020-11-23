## Before start

1) Execute `bundle` command;
2) Create and migrate DB;
3) Add credentials for `MAILGUN` and `SPARKPOST` using next pattern:
    ```
    mailers:
        MAILGUN_API_KEY: API_KEY
        MAILGUN_DOMAIN: DOMAIN
        SPARKPOST_API_KEY: ANOTHER_KEY
        SPARKPOST_EXAMPLE_EMAIL: anything@sparkpostbox.com
    ```

 Execute `rails s` for starting server, `rspec spec` for running specs

## Sort

In `clients/:id/companies_list` you can use sort by `created_at` or `subjct`. Sort param format:
  1) Key: `order`
  2) Value: `created_at/subject asc/desc`
