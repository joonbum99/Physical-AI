from ultralytics import YOLO

# 1. YOLO26 PyTorch 모델 불러오기
model = YOLO("yolo26n.pt")

# 2. ONNX 형식으로 변환
onnx_path = model.export(
    format="onnx",
    imgsz=640,
    opset=12,
    simplify=True
)

print(f"ONNX 변환 완료: {onnx_path}")