# Raspberry Pi (ARM64) Docker Practice Environment

이 프로젝트는 라즈베리파이 실물이 없을 때 PC(Mac/Windows/Linux)에서 라즈베리파이와 동일한 ARM64 환경을 가상으로 구축하고, SSH 및 모델 추론 테스트를 수행할 수 있도록 구성된 템플릿입니다.

## 1. 실행 방법

```bash
# 컨테이너 빌드 및 실행
docker-compose up -d --build
```

## 2. SSH 접속 방법

```bash
ssh root@localhost -p 2222
# 비밀번호: raspberry
```

## 3. 모델 실습 방법

SSH 접속 후 `/workspace` 디렉터리로 이동하여 파이썬 테스트 스크립트를 실행합니다.

```bash
cd /workspace
python3 test_infer.py
```

## 4. 로컬 코드 동기화

`./app` 폴더 내에 작성한 모델 파일(`.onnx`, `.tflite`)과 파이썬 코드를 넣으면 컨테이너 안의 `/workspace` 폴더에 즉시 연동됩니다.
