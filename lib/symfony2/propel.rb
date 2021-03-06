namespace :symfony do
  namespace :propel do
    namespace :database do
      desc "Creates the configured databases"
      task :create do
        run "cd #{latest_release} && #{php_bin} #{symfony_console} propel:database:create --env=#{symfony_env_prod}"
      end

      desc "Drops the configured databases"
      task :drop do
        run "cd #{latest_release} && #{php_bin} #{symfony_console} propel:database:drop --env=#{symfony_env_prod}"
      end
    end

    namespace :build do
      desc "Builds the Model classes"
      task :model do
        command = "propel:model:build"
        if /2\.0\.[0-9]+.*/ =~ symfony_version
          command = "propel:build-model"
        end

        run "cd #{latest_release} && #{php_bin} #{symfony_console} #{command} --env=#{symfony_env_prod}"
      end

      desc "Builds SQL statements"
      task :sql do
        command = "propel:sql:build"
        if /2\.0\.[0-9]+.*/ =~ symfony_version
          command = "propel:build-sql"
        end

        run "cd #{latest_release} && #{php_bin} #{symfony_console} #{command} --env=#{symfony_env_prod}"
      end

      desc "Builds the Model classes, SQL statements and insert SQL"
      task :all_and_load do
        run "cd #{latest_release} && #{php_bin} #{symfony_console} propel:build --insert-sql --env=#{symfony_env_prod}"
      end

      desc "Generates ACLs models"
      task :acl do
        run "cd #{latest_release} && #{php_bin} #{symfony_console} propel:acl:init --env=#{symfony_env_prod}"
      end

      desc "Inserts propel ACL tables"
      task :acl_load do
        run "cd #{latest_release} && #{php_bin} #{symfony_console} propel:acl:init --env=#{symfony_env_prod} --force"
      end
    end
  end
end
