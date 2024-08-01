<template>
  <div>
    <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">

    <title>背景动态变化的登录界面2.0</title>
</head>

<body style="height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(to top left,#87CEFF,#1E90FF,#0000FF);
            overflow: hidden;">
    <div style="text-align: center;
                color: #fff;">
        <h1 style="font-size: 40px;
                    font-weight: 100;
                    letter-spacing: 2px;
                    margin-bottom: 15px;
                    transition: 1s ease-in-out;">Welcome</h1>
        <div class="form">
            <input type="text" v-model="input1" placeholder="您的账号">
            <input type="password" v-model="input2" placeholder="您的密码">
            <button class="btn-login" @click="login">登录</button>
        </div>
    </div>
    <ul class="bg-squares">
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
    </ul>
</body>
</div>
</template>

<script>
import axios from 'axios';
  export default {
    data() {
      return {
        input1:'',
        input2:'',
    }
  },
    methods: {
      login() {
        const name=this.input1
        const pass=this.input2
        axios.get(`http://localhost:8080/Admin/login/${name}/${pass}`)
          .then(response => {
            console.log("------------->",response.data.data[0].adiminId)
            const id=response.data.data[0].adiminId
            console.log(typeof id)
            if(id != 0)
        {
        this.$router.push({ name: "AdminCenter" });
        this.$notify({
          title: '登录成功',
          message: h('i', { style: 'color: teal'}, 'Wlcome！！！')
        });
      }
          })
          .catch(error => {
            console.log(error)
            this.$notify({
          title: '密码或账户错误',
          message: h('i', { style: 'color: red'}, 'EEROR！！！')
        });
          });
        const h = this.$createElement;
      },
    }
  }
</script>
<style>
*{
    /* 初始化 */
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    overflow: hidden;
}
.form{
    display: flex;
    flex-direction: column;
    align-items: center;
    position: relative;
    z-index: 2;
    opacity: 1;
    /* 不透明度改变时的过渡效果 */
    transition: opacity 0.5s;
}
.form input{
    outline: none;
    border: 1px solid rgba(255,255,255,0.4);
    background-color: rgba(255,255,255,0.2);
    width: 250px;
    padding: 10px 15px;
    border-radius: 3px;
    margin: 0 auto 10px auto;
    text-align: center;
    color: #fff;
    font-size: 15px;
    transition: 0.25s;
}
.form input::placeholder{
    color: #fff;
    font-size: 14px;
    font-weight: 300;
}
.form input:hover{
    background-color: rgba(255,255,255,0.4);
}
.form input:focus{
    background-color: #fff;
    width: 300px;
    color: #1E90FF;
}
.btn-login{
    outline: none;
    background-color: #fff;
    color: #1E90FF;
    border: none;
    width: 250px;
    padding: 10px 15px;
    border-radius: 3px;
    font-size: 15px;
    cursor: pointer;
    transition: 0.25s;
}
.btn-login:hover{
    background-color: #f5f7f9;
}
/* 背景方块 */
.bg-squares{
    list-style: none;
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 1;
}
.bg-squares li{
    width: 40px;
    height: 40px;
    background-color: rgba(255,255,255,0.15);
    position: absolute;
    bottom: -100px;
    /* 执行动画：动画名 时长 线性 无限次播放 */
    animation: square 20s linear infinite;
}
/* 为每一个方块设置不同的位置、大小、动画延迟时间、动画时长、背景色 */
.bg-squares li:nth-child(1){
    left: 10%;
}
.bg-squares li:nth-child(2){
    left: 20%;
    width: 80px;
    height: 80px;
    /* 动画延迟时间 */
    animation-delay: 2s;
    /* 动画时长 */
    animation-duration: 17s;
}
.bg-squares li:nth-child(3){
    left: 25%;
    animation-delay: 4s;
}
.bg-squares li:nth-child(4){
    left: 40%;
    width: 60px;
    height: 60px;
    background-color: rgba(255,255,255,0.25);
    animation-duration: 22s;
}
.bg-squares li:nth-child(5){
    left: 70%;
}
.bg-squares li:nth-child(6){
    left: 80%;
    width: 120px;
    height: 120px;
    background-color: rgba(255,255,255,0.2);
    animation-delay: 3s;
}
.bg-squares li:nth-child(7){
    left: 32%;
    width: 160px;
    height: 160px;
    animation-delay: 7s;
}
.bg-squares li:nth-child(8){
    left: 55%;
    width: 20px;
    height: 20px;
    animation-delay: 15s;
    animation-duration: 40s;
}
.bg-squares li:nth-child(9){
    left: 25%;
    width: 10px;
    height: 10px;
    background-color: rgba(255,255,255,0.3);
    animation-delay: 2s;
    animation-duration: 40s;
}
.bg-squares li:nth-child(10){
    left: 90%;
    width: 160px;
    height: 160px;
    animation-delay: 11s;
}
.container.success h1{
    transform: translateY(75px);
}
.container.success .form{
    opacity: 0;
    visibility: hidden;
}

/* 定义动画 */
@keyframes square {
    0%{
        transform: translateY(0);
    }
    100%{
        transform: translateY(-120vh) rotate(600deg);
    }
}
</style>