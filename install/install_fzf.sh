#!/bin/bash

# fzf 설치 스크립트

echo "fzf를 설치합니다..."

# fzf 설치 여부 확인
if command -v fzf > /dev/null; then
	echo "fzf가 이미 설치되어 있습니다."
	exit 0
fi

echo "fzf가 설치되지 않았습니다. 설치를 시작합니다..."

# 시스템 패키지 목록을 업데이트
sudo apt-get update

# fzf 설치
sudo apt-get install -y fzf

# 설치 확인
if command -v fzf > /dev/null; then
    echo "fzf가 성공적으로 설치되었습니다."
else
    echo "fzf 설치에 실패했습니다."
    exit 1
fi

# .bashrc에 fzf 설정 추가
echo "fzf 설정을 .bashrc에 추가합니다..."
echo '[ -f ~/.fzf.bash ] && source ~/.fzf.bash' >> ~/.bashrc

# .bashrc를 다시 로드
source ~/.bashrc

echo "설치가 완료되었습니다. 이제 터미널에서 fzf를 사용할 수 있습니다."
