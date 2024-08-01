<template>
    <div class="head2"> 
      <el-container>
        <el-header style="display: flex; height: 100px; background-color: #FFAEB9 ;border-radius:15px;box-shadow: 2px 2px 2px 2px #BEBEBE;" >
          <i
            class="el-icon-document-remove"
            style="
              font-size: 40px;
              height: 40px;
              align-self: center;
              margin-left: 50px;">
          </i>
          <h3 style="margin-left: 5px; align-self: center">领养统计</h3>
  
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
            <hr style="margin: 10px 0px 10px 0px;">
            <div style="display: flex">
            <p style="margin-top: 10px">最受欢迎的种类：</p>
            <el-input
            style="width: 100px; --input-text-color: red;"
            placeholder="请输入内容"
            v-model="input1"
            :disabled="true">
          </el-input>
          <el-input
          style="width: 100px; margin-left: 20px"  
            placeholder="请输入内容"
            v-model="input2"
            :disabled="true">
          </el-input>
        </div>
        <el-table :data="tableData1" border 
            v-loading="loading"
            style="width:250px; border-radius: 15px; margin-top: 10px;margin-left: 10px; border: 2px solid #ccc" 
            max-height="400px">
              <el-table-column
                prop="region"
                label="地区"
                sortable
                width="101">
              </el-table-column>
              <el-table-column
                prop="count2"
                label="地区"
                sortable
                width="101">
              </el-table-column>
            </el-table>
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
        loading:true,
        inputSelect1:'',
        inputSelect2:'',
        input1:'',
        input2:'',
        drawer: false,
        tableData1:[
        ]
        }
    },
    methods: {
    back(){
      this.$router.push({ name: "AdminCenter" });
    },
    handleClick(row) {
        console.log(row);
    },
    selectInput(value) {
        console.log('Input changed:', value);
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
      axios.get("http://localhost:8080/Common/popular").then((result) => {
          this.input1=result.data.data[0].category
          this.input2=result.data.data[0].count1
          
      });
      
      this.loading = true;
        setTimeout(() => {
          this.loading = false;
        }, 1000);
    },
    },
    mounted(){
      axios.get("http://localhost:8080/Common/region").then((result) => {
          this.tableData1=result.data.data
          console.log("----->",this.tableData1[0])
          this.$message({
          showClose: true,
          message: '数据已加载',
          type: 'success'
        });
      });
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