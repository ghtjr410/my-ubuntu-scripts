#!/bin/bash

# 모든 파일의 권한을 실행 가능하게 변경하는 함수
make_executable() {
    echo "모든 파일의 권한을 실행 가능하게 변경합니다..."
    find . -type f -exec chmod +x {} \;
    echo "모든 파일의 권한이 실행 가능하게 변경되었습니다."
}

# 파일을 선택하여 실행하는 함수
execute_file() {
    echo "파일을 선택하여 실행합니다..."
    
    # fzf로 파일 선택
    selected_file=$(find . -type f | fzf --height 20%)
    
    if [ -z "$selected_file" ]; then
        echo "파일이 선택되지 않았습니다."
        return
    fi
    
    echo "선택된 파일: $selected_file"
    
    # 파일 실행
    "$selected_file"
}

# 메뉴 표시 및 사용자 선택 처리
while true; do
    echo "파일 관리 스크립트"
    echo "1) 모든 파일의 권한을 실행 가능하게 변경"
    echo "2) 파일 선택 후 실행"
    echo "3) 종료"
    read -p "원하는 작업을 선택하세요 (1-3): " choice

    case $choice in
        1) make_executable ;;
        2) execute_file ;;
        3) echo "종료합니다."; exit 0 ;;
        *) echo "잘못된 선택입니다. 다시 시도하세요." ;;
    esac
done
