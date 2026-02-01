<?php
include 'condb.php';
header("Content-Type: application/json; charset=UTF-8");

try {
    $method = $_SERVER['REQUEST_METHOD'];

    // ✅ ดึงข้อมูลทั้งหมด
    if ($method === "GET") {
        $stmt = $conn->prepare("SELECT * FROM tb_type ORDER BY type_id DESC");
        $stmt->execute();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
        echo json_encode(["success" => true, "data" => $result]);
    }

    // ✅ เพิ่มข้อมูล
    elseif ($method === "POST") {
        // ตรวจสอบว่าข้อมูลมาจาก JSON หรือ form-data
        $contentType = $_SERVER["CONTENT_TYPE"] ?? '';

        if (stripos($contentType, "application/json") !== false) {
            $data = json_decode(file_get_contents("php://input"), true);
        } else {
            $data = $_POST;
        }

        // ตรวจสอบค่าว่าง
        if (empty($data["type_name"])) {
            echo json_encode(["success" => false, "message" => "กรุณากรอกข้อมูลให้ครบ"]);
            exit;
        }


        // เพิ่มข้อมูลพนักงาน
        $stmt = $conn->prepare("INSERT INTO tb_type (type_id, type_name)
                                VALUES (:type_id, :type_name)");

        $stmt->bindParam(":type_id", $data["type_id"]);
        $stmt->bindParam(":type_name", $data["type_name"]);

        

        if ($stmt->execute()) {
            echo json_encode(["success" => true, "message" => "เพิ่มข้อมูลเรียบร้อย"]);
        } else {
            echo json_encode(["success" => false, "message" => "ไม่สามารถเพิ่มข้อมูลได้"]);
        }
    }

    // ✅ แก้ไขข้อมูล
    elseif ($method === "PUT") {
        $data = json_decode(file_get_contents("php://input"), true);

        if (!isset($data["type_id"])) {
            echo json_encode(["success" => false, "message" => "ไม่พบค่า type_id"]);
            exit;
        }

        $emp_id = intval($data["type_id"]);

            $sql = "UPDATE tb_type 
                    SET type_name = :type_name 
                    WHERE type_id = :id";

        $stmt = $conn->prepare($sql);
        $stmt->bindParam(":type_name", $data["type_name"]);

        $stmt->bindParam(":id", $emp_id, PDO::PARAM_INT);

        if ($stmt->execute()) {
            echo json_encode(["success" => true, "message" => "แก้ไขข้อมูลเรียบร้อย"]);
        } else {
            echo json_encode(["success" => false, "message" => "ไม่สามารถแก้ไขข้อมูลได้"]);
        }
    }

    // ✅ ลบข้อมูล
    elseif ($method === "DELETE") {
        $data = json_decode(file_get_contents("php://input"), true);

        if (!isset($data["type_id"])) {
            echo json_encode(["success" => false, "message" => "ไม่พบค่า type_id"]);
            exit;
        }

        $stmt = $conn->prepare("DELETE FROM tb_type WHERE type_id = :id");
        $stmt->bindParam(":id", $data["type_id"], PDO::PARAM_INT);

        if ($stmt->execute()) {
            echo json_encode(["success" => true, "message" => "ลบข้อมูลเรียบร้อย"]);
        } else {
            echo json_encode(["success" => false, "message" => "ไม่สามารถลบข้อมูลได้"]);
        }
    }

    else {
        echo json_encode(["success" => false, "message" => "Method ไม่ถูกต้อง"]);
    }

} catch (Exception $e) {
    echo json_encode(["success" => false, "message" => $e->getMessage()]);
}
?>