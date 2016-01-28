# based on gitlab's implementation of the same
name "mysql_client"
default_version "5.5.37"

dependency "openssl"
dependency "zlib"
dependency "ncurses"

source  :url => "http://dev.mysql.com/get/Downloads/MySQL-5.5/mysql-5.5.37.tar.gz",
        :md5 => "bf1d80c66d4822ec6036300399a33c03"

relative_path "mysql-#{version}"

env = with_standard_compiler_flags(with_embedded_path)
env.merge!(
  "CXXFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CPPFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
)

build do

  command [
            "cmake",
            "-DCMAKE_SKIP_RPATH=YES",
            "-DCMAKE_INSTALL_PREFIX=#{install_dir}/embedded",
            "-DWITH_SSL=system",
            "-DOPENSSL_INCLUDE_DIR:PATH=#{install_dir}/embedded/include",
            "-DOPENSSL_LIBRARIES:FILEPATH=#{install_dir}/embedded/lib/libssl.so",
            "-DWITH_ZLIB=system",
            "-DZLIB_INCLUDE_DIR:PATH=#{install_dir}/embedded/include",
            "-DZLIB_LIBRARY:FILEPATH=#{install_dir}/embedded/lib/libz.so",
            "-DCRYPTO_LIBRARY:FILEPATH=#{install_dir}/embedded/lib/libcrypto.so",
            "-DMYSQL_UNIX_ADDR=/var/lib/mysql/mysql.sock",
            ".",
           ].join(" "), :env => env

  %w{libmysql client include}.each do |target|
    command "make -j #{workers} install", :env => env, :cwd => "#{project_dir}/#{target}"
  end
end
