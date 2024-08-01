<template>
    <div class="head2"> 
      <el-container>
        <el-header style="display: flex; height: 100px; background-color: #F5F5F5 ;border-radius:15px;box-shadow: 2px 2px 2px 2px #BEBEBE;" >
          <i
            class="el-icon-bell"
            style="
              font-size: 40px;
              height: 40px;
              align-self: center;
              margin-left: 50px;">
          </i>
          <h3 style="margin-left: 5px; align-self: center">通知管理</h3>
  
        <el-drawer
           title="我是标题"
            :visible.sync="drawer"  
              :with-header="false">
              <div style="margin: 10px 10px 10px 10px;">
                  <el-button type="primary" icon="el-icon-s-opportunity"  style="color: white;">提示</el-button>
                  <div style="margin-top: 20px"><el-button type="info" icon="el-icon-user-solid" circle @click="back"></el-button><h style="">：此按钮返回管理员中心</h></div>
                  <div style="margin-top: 15px"><el-button type="primary" icon="el-icon-thumb" circle></el-button><h style="">：此按钮打开提示</h></div>
                  <div style="margin-top: 15px"><el-button type="primary" icon="el-icon-refresh-right" circle ></el-button><h style="">：此按钮刷新数据</h></div>
                </div>
            </el-drawer>
          <el-button type="primary" round @click="Adminout" style="height: 40px; align-self: center; margin-left: 950px;"
            >退出</el-button>
        </el-header>
        <el-container class="aside" style="margin-top: 10px;" >
          <el-aside style="display: block;box-shadow: 2px 2px 2px 2px #BEBEBE;" >
            <el-menu unique-opened="true">
              <el-submenu index="1">
                <template slot="title">
                  <i class="el-icon-user" style="margin-left: 55px; font-size: 25px"></i>
                  <span style="font-size: 20px">用户管理</span>
                </template>
                <el-menu-item-group>
                  <template slot="title"></template>
                  <el-menu-item index="1-1" style="text-align: center"><router-link to="/InfoUser" style="color: black;">用户信息管理</router-link></el-menu-item>
                  <el-menu-item index="1-2" style="text-align: center"><router-link to="/AppUser" style="color: black;">用户申请管理</router-link>
                    </el-menu-item>
                  <el-menu-item index="1-3" style="text-align: center"><router-link to="/ComplaintsUser" style="color: black;">用户投诉管理</router-link></el-menu-item>
                </el-menu-item-group>
              </el-submenu>
  
              <el-submenu index="2">
                <template slot="title">
                  <i class="el-icon-chicken" style="margin-left: 55px; font-size: 25px"></i>
                  <span style="font-size: 20px">宠物管理</span>
                </template>
                <el-menu-item-group>
                  <template slot="title"></template>
                  <el-menu-item index="2-1" style="text-align: center"><router-link to="/AdminPetInfo" style="color: black;">宠物信息管理</router-link></el-menu-item>
                  <el-menu-item index="2-2" style="text-align: center"><router-link to="/AdminPetApp" style="color: black;">宠物领养情况</router-link></el-menu-item>
                  <el-menu-item index="2-3" style="text-align: center"><router-link to="/PetTag" style="color: black;">宠物标签情况</router-link></el-menu-item>
                </el-menu-item-group>
              </el-submenu>
  
              <el-submenu index="3">
                <template slot="title">
                  <i class="el-icon-bell" style="margin-left: 55px; font-size: 25px"></i>
                  <span style="font-size: 20px">通知管理</span>
                </template>
                <el-menu-item-group>
                  <template slot="title"></template>
                  <el-menu-item index="3-1" style="text-align: center"><router-link to="/AdminNotification" style="color: black;">用户通知</router-link></el-menu-item>
                </el-menu-item-group>
              </el-submenu>
  
              
              <el-submenu index="4">
                <template slot="title">
                  <i class="el-icon-document-remove" style="margin-left: 55px; font-size: 25px"></i>
                  <span style="font-size: 20px">数据统计</span>
                </template>
                <el-menu-item-group>
                  <template slot="title"></template>
                  <el-menu-item index="4-1" style="text-align: center;"><router-link to="/petCount" style="color: black;">领养统计</router-link></el-menu-item>
                  
                </el-menu-item-group>
              </el-submenu>
            </el-menu>
          </el-aside>
  
          <el-main>
            <el-button type="info" icon="el-icon-user-solid" circle @click="back"></el-button>
            <el-button @click="drawer = true" type="primary" icon="el-icon-thumb" circle></el-button>
            <el-button type="primary" icon="el-icon-refresh-right" circle @click="load"></el-button>
            <el-button type="primary" icon="el-icon-edit" circle ></el-button>
            <hr style="margin: 10px 0px 10px 0px;">
            <div style="display: flex;">
            <el-input
                placeholder="账户名查询"
                v-model="inputSelect1"
                @change="selectInput"
                prefix-icon="el-icon-search"
                style="width: 200px;"
                clearable>
            </el-input>
            
            <div class="block">
              <span class="demonstration"></span>
              <el-date-picker
                style="margin-left: 10px;"
                v-model="value1"
                @change="selectInput"
                type="daterange"
                value-format="yyyy-MM-dd"
                range-separator="至"
                start-placeholder="开始日期"
                end-placeholder="结束日期">
              </el-date-picker>
            </div>
          </div>
            <el-table
                    :data="tableData"
                    v-loading="loading"
                    border
                    style="width: 100%; border-radius: 15px; margin-top: 10px;border: 2px solid #ccc" 
                    max-height="575px">
                    <el-table-column
                    fixed
                    prop="notificationTIme"
                    sortable
                    label="日期"
                    width="150">
                    </el-table-column>
                    <el-table-column
                    prop="username"
                    sortable
                    label="用户名"
                    width="120">
                    </el-table-column>
                    <el-table-column
                    prop="systemNotificationId"
                    sortable
                    label="通知编号"
                    width="120">
                    </el-table-column>
                    <el-table-column
                    prop="notificationContent"
                    label="通知内容"
                    width="360">
                    </el-table-column>
                    <el-table-column
                    fixed="right"
                    label="操作"
                    width="100">
                    <template slot-scope="scope">
                    <el-button @click="handleClick(scope.row)" type="text" size="small">查看</el-button>
                </template>
                </el-table-column>
            </el-table>

            <el-dialog :visible.sync="seeNotification" title="通知内容">
              <el-form ref="from" :model="from" label-width="120px">
                <el-form-item label="通知编号">
                  <el-input v-model="from.systemNotificationId" ></el-input>
                </el-form-item> 
                <el-form-item label="通知内容">
                  <el-input type="textarea" v-model="from.notificationContent"></el-input>
                </el-form-item>
              </el-form>
            </el-dialog>
        </el-main>


        </el-container>
      </el-container>
    </div>
  </template>
  
  <script>
import axios from 'axios';
  export default {
    data() {
      return {
        loading:false,
        seeNotification:false,
        inputSelect1:'',
        drawer: false,
        tableData: [],
        from:{},
        value1:'',
        }
    },
    methods: {
    selectInput() {
        const username = this.inputSelect1 || ''; // 如果没有输入则传递 'null'
        const d1= this.value1[0] || '';
        const d2= this.value1[1] || '';
        console.log("11111111",username,d1,d2)
        axios.get(`http://localhost:8080/Common/selectDyNo?username=${username}&d1=${d1}&d2=${d2}`)
          .then(response => {
            console.log(response.data)  
            this.tableData = response.data.data;
          })
          .catch(error => {
            console.error('查询失败:', error);
            this.$message.error('查询失败!');
          });
    },
    handleClick(row){
      console.log(this.value1[1])
      this.seeNotification=true
        this.from.systemNotificationId=row.systemNotificationId
        this.from.notificationContent=row.notificationContent
    },
    back(){
      this.$router.push({ name: "AdminCenter" });
    },
      Adminout() {
        this.$confirm("您要退出账号吗？", "提示", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning",
        })
          .then(() => {
            this.$router.push({ name: "LoginUi" });
            this.$message({
              type: "success",
              message: "退出成功!",
            });
          })
          .catch(() => {
            this.$message({
              type: "info",
              message: "已取消操作",
            });
          });
      },
      load(){
        this.loading = true;
        setTimeout(() => {
          this.loading = false;
        }, 1000);
      axios.get("http://localhost:8080/Common/listNotification").then((result) => {
          this.tableData=result.data.data
          this.$message({
          showClose: true,
          message: '数据已加载',
          type: 'success'
        });
      });
    },
  },
    mounted() {
    //发送异步请求，获取数据
    this.load()
  },
  };
  </script >
  
  <style>
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    text-decoration: none;

  }
  </style>