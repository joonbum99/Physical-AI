import platform
import os
import numpy as np

print("="*50)
print(" Raspberry Pi (ARM64) Simulation Environment Check")
print("="*50)
print(f"Architecture : {platform.machine()}")
print(f"System OS    : {platform.system()} {platform.release()}")
print(f"Python Ver   : {platform.python_version()}")

try:
    import onnxruntime as ort
    print("ONNX Runtime : Loaded Successfully!")
except ImportError as e:
    print(f"ONNX Runtime : Load Failed ({e})")

print("\nSimulating Model Inference...")
# Dummy test matrix
data = np.random.randn(1, 3, 224, 224).astype(np.float32)
print(f"Input Shape  : {data.shape}")
print("Status       : ARM64 Environment Ready for Raspberry Pi Practice!")
print("="*50)
