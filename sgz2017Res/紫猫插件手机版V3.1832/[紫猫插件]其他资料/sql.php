<?php

header("Content-Type:text/html;charset=UTF-8");

// If you installed via composer, just use this code to requrie autoloader on the top of your projects.
require_once 'medoo.php';

//数据表前缀
$prefix = "";

@$action = $_POST["action"];
@$table = $_POST["table"];
@$key = $_POST["key"];
@$value = $_POST["value"];
@$type = $_POST["type"];
@$isdel = $_POST["isdel"];
@$query = $_POST["query"];
@$startrow = $_POST["startrow"];
@$rows = $_POST["rows"];

// Using Medoo namespace
use Medoo\Medoo;

$database = new Medoo([
	//数据库类型
	'database_type' => 'mysql',
	//数据库名
	'database_name' => 'test',
	//数据库地址
	'server' => 'localhost',
	//数据库账户
	'username' => 'root',
	//数据库密码
	'password' => 'root',
 
	// [optional]
	'charset' => 'utf8',
	'port' => 3306,
 
	// [optional] Table prefix
	'prefix' => $prefix,
 
	// [optional] Enable logging (Logging is disabled by default for better performance)
	'logging' => false,
 
	// [optional] MySQL socket (shouldn't be used with server and port)
	'socket' => '/tmp/mysql.sock',
 
	// [optional] driver_option for connection, read more from http://www.php.net/manual/en/pdo.setattribute.php
	'option' => [
		PDO::ATTR_CASE => PDO::CASE_NATURAL
	],
 
	// [optional] Medoo will execute those commands after connected to the database for initialization
	'command' => [
		'SET SQL_MODE=ANSI_QUOTES',
	]
]);

switch ($action) {
	case 'get':
		//获取数据
		$ret = $database->get($table, [
			"value",
			"type"
		], [
			"key" => $key
		]);
		echo json_encode($ret, JSON_UNESCAPED_UNICODE);
		// echo $ret;
		if ($isdel=="true") {
			$ret = $database->delete($table, [
				"key" => $key
			]);
		}
		break;
	case 'set':
		//设置数据
		if ($database->has($table,[
			"key" => $key
		])) {
			// echo "修改" . $key . "=" . $value;
			$ret = $database->update($table, [
				"value"=>$value,
				"type"=>$type
			], [
				"key"=>$key
			]);
		} else {
			// echo "新增" . $key . "=" . $value;
			$ret = $database->insert($table, [
				"key"=>$key,
				"value"=>$value,
				"type"=>$type
			]);
		}
		echo $ret->rowCount();
		break;
	case 'del':
		//删除数据
		// echo "删除" . $key;
		$ret = $database->delete($table, [
			"key" => $key
		]);
		echo $ret->rowCount();
		break;
	case 'init':
		//初始化数据
		//echo "初始化共享数据:" . $prefix . $table;
		$qv = "CREATE TABLE IF NOT EXISTS `" . $prefix . $table . "` (
			`id` int(11) NOT NULL AUTO_INCREMENT,
			`key` varchar(200) COLLATE utf8mb4_bin NOT NULL,
			`value` longtext COLLATE utf8mb4_bin NOT NULL,
			`type` varchar(10) COLLATE utf8mb4_bin NOT NULL,
			PRIMARY KEY (`id`),
			KEY `key` (`key`)
			) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin AUTO_INCREMENT=1 ;";

		if ($isdel=="true") {
			$qv = "DROP TABLE IF EXISTS `" . $prefix . $table . "`;" . $qv;
		}

		$ret = $database->query($qv);
		break;
	case 'getrows':
		//获取多行数据
		$ret = $database->select($table, "*", [
			"LIMIT" => [
				$startrow,
				$rows
			],
			"ORDER" => ["id"=>"ASC"]
		]);
		echo json_encode($ret, JSON_UNESCAPED_UNICODE);
		if ($isdel=="true") {
			$database->delete($table, [
				"id" => $database->select($table, "id", [
						"LIMIT" => [
							$startrow,
							$rows
						],
						"ORDER" => ["id"=>"ASC"]
					]
				)
			]);
		}
		break;
	case 'count':
		//执行sql代码
		$ret = $database->count($table);
		echo $ret;
		break;
	case 'query':
		//执行sql代码
		$ret = $database->query($query)->fetchAll();
		echo json_encode($ret, JSON_UNESCAPED_UNICODE);
		break;
	default:
		echo "通信成功";
		break;
}
?>
