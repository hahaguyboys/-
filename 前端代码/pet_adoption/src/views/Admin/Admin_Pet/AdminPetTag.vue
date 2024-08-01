<template>
    <div class="head2">
      <el-container>
        <el-header
          style="display: flex; height: 100px; background-color: #bbffff;border-radius:15px;
              box-shadow: 2px 2px 2px 2px #BEBEBE;">
          <i
            class="el-icon-user"
            style="
              font-size: 40px;
              height: 40px;
              align-self: center;
              margin-left: 50px;
            "
          >
          </i>
          <h3 style="margin-left: 5px; align-self: center">标签管理</h3>
  
          <el-drawer title="我是标题" :visible.sync="drawer" :with-header="false">
            <div style="margin: 10px 10px 10px 10px">
              <el-button
                type="primary"  
                icon="el-icon-s-opportunity"
                style="color: white"
                >提示</el-button
              >
              <div style="margin-top: 20px">
                <el-button
                  type="info"
                  icon="el-icon-user-solid"
                  circle
                  @click="back"
                ></el-button
                ><h style="">：此按钮返回管理员中心</h>
              </div>
              <div style="margin-top: 15px">
                <el-button type="primary" icon="el-icon-thumb" circle></el-button
                ><h style="">：此按钮打开提示</h>
              </div>
              <div style="margin-top: 15px">
                <el-button
                  type="primary"
                  icon="el-icon-refresh-right"
                  circle
                ></el-button
                ><h style="">：此按钮刷新数据</h>
              </div>
            </div>
          </el-drawer>
          <el-button
            type="primary"
            round
            @click="Adminout"
            style="height: 40px; align-self: center; margin-left: 950px"
            >退出</el-button
          >
        </el-header>
        <el-container class="aside" style="height: 740px; margin-top: 10px" >
          <el-aside style="display: block;box-shadow: 2px 2px 2px 2px #BEBEBE;" >
              <el-menu background-color=#fff text-color="black" unique-opened="true" style="height: 100%;">
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
  
          <el-main style="overflow: hidden;">
            <el-button
              type="info"
              icon="el-icon-user-solid"
              circle
              @click="back"
            ></el-button>
            <el-button
              @click="drawer = true"
              type="primary"
              icon="el-icon-thumb"
              circle
            ></el-button>
            <el-button
              type="primary"
              icon="el-icon-refresh-right"
              circle
              @click="load" 
            ></el-button>
            <el-button
              type="primary"
              icon="el-icon-edit"
              circle
              @click="addTagFun" 
            ></el-button>
            <hr style="margin: 10px 0px 10px 0px" />
            <div style="display: flex; position: relative;">
            <el-table :data="tableData" border 
            v-loading="loading"
            style="width:500px; border-radius: 15px; margin-top: 10px;border: 2px solid #ccc" 
            max-height="575px">
              <el-table-column
                fixed
                prop="petId"
                label="宠物编号"
                sortable
                width="101"
              >
              </el-table-column>
              <el-table-column 
              prop="breed" label="种类" sortable width="120">
              </el-table-column>
              <el-table-column
                prop="petName"
                label="宠物名"
                width="120"
              >
              </el-table-column>
              <el-table-column prop="gender" label="性别" width="50px">
              </el-table-column>
              <el-table-column label="操作" width="100">
                <template slot-scope="scope">
                <el-button @click="handleClick(scope.row)" type="primary" round size="mini">查看</el-button>
                </template>
              </el-table-column>
            </el-table>
  
            <template>
                <el-dialog :visible.sync="dialogVisible" title="宠物标签信息">
                    <el-form ref="form" :model="form" label-width="120px">
                    <el-form-item label="宠物编号">
                        <el-input v-model="form.petId" disabled="disabled"></el-input>
                    </el-form-item>
                    
                    <el-form-item label="宠物标签">
                        <div v-loading="loading">
                        <el-tag 
                            v-for="(tag, index) in form.tagName" 
                            :key="index" 
                            type="item.type"
                            style="margin-right: 10px; margin-bottom: 10px;">
                            {{ tag }}
                        </el-tag>
                        </div>
                    </el-form-item>
                    </el-form>
                </el-dialog>
                </template>

            <el-table :data="tableData1" border 
            v-loading="loading"
            style="width:500px; border-radius: 15px; margin-top: 10px;margin-left: 10px; border: 2px solid #ccc" 
            max-height="575px">
              <el-table-column
                fixed
                prop="tagId"
                label="标签编号"
                sortable
                width="101">
              </el-table-column>
              <el-table-column
                fixed
                prop="tagName"
                label="标签名"
                sortable
                width="120">
              </el-table-column>
              <el-table-column label="操作" width="100">
                <template slot-scope="scope">
                <el-button @click="drop(scope.row)" type="danger" round size="mini">删除</el-button>
                </template>
              </el-table-column>
            </el-table>
              </div>
              <template>
                <el-dialog :visible.sync="addTag" title="添加标签">
                    <el-form ref="formAdd" :model="formAdd" label-width="120px">
                    <el-form-item label="宠物标签">
                      <el-input v-model="formAdd.tagName"> </el-input>
                    </el-form-item>
                    <template>
                    <el-button @click="addTagFun()"  round type="primary" style="margin-left: 350px;">保存</el-button>
                    </template>
                    </el-form>
                </el-dialog>
                </template>
          </el-main>
        </el-container>
      </el-container>
    </div>
  </template>
    
    <script>
  import axios from "axios";
  export default {
    data() {
      return {
        addTag:false,
        tagNameAll:'',
        tagName:'',
        loading:true,
        inputSelect1: '',
        inputSelect2: '',
        drawer: false,
        dialogVisible: false,
        tableData1:[],
        tableData: [],
        form: {
            tagName: [],
        },
        formAdd:{
          tagName:'',
        },
      };
    },
    methods: {
    drop(row){
        const tagId=row.tagId;
        console.log(tagId)
        this.$alert('你确定要删除这个标签吗', '删除标签', {
          confirmButtonText: '确定',
          callback: action => {
            if (action === 'confirm') {
            axios.delete(`http://localhost:8080/Common/deleteTag/${tagId}`)
          .then(response => {
          console.log('Response:', response.data);
          this.$message({
          message: '删除成功！！！',
          type: 'success'
        });
      })
      .catch(error => {
          console.error('提交失败:', error);
        });
        }
          }
        });
        
    },
    addTagFun(){
          this.addTag=true
          console.log(this.formAdd.tagName)
          const name=this.formAdd.tagName
          axios.put(`http://localhost:8080/Common/addTag/${name}`,)
          .then(response => {
          console.log('Response:', response.data);
    this.$message({
          message: '添加成功！！！',
          type: 'success'
        });
        this.addTag=false
    // 根据后端返回的数据进行逻辑处理
  })
  .catch(error => {
    console.error('Error:', error);
    // 捕获并处理错误
    if (error.response) {
      // 请求已经发出，但服务器响应返回的状态码不在 2xx 范围内
      console.error('Server Error Status:', error.response.status);
      if (error.response.status === 500) {
        // 显示服务器内部错误提示
        this.$message({
          message: '添加失败！！',
          type: 'error'
        });
      }
    }
  });
          },
    selectInput() {
          const name = this.inputSelect1 || ''; // 如果没有输入则传递 'null'
          const gender = this.inputSelect2 || ''; // 如果没有输入则传递 'null'
          axios.get(`http111://localhost:8080/User/selectUser?name=${name}&gender=${gender}`)
            .then(response => {
              console.log(response.data)
              this.tableData = response.data.data;
            })
            .catch(error => {
              console.error('查询失败:', error);
              this.$message.error('查询失败!');
            });
        },
      handleClick(row) {
        this.form.petId = row.petId; // 使用展开运算符复制行数据到表单
         // 打开对话框
        const petId=this.form.petId
        console.log("----->",petId)
        this.dialogVisible = true;
        axios.get(`http://localhost:8080/Common/selecTag/${petId}`)
        .then(response => {
          console.log("----->", response.data.data);
          this.form.tagName = response.data.data;
        })
        .catch(error => {
          console.error('失败:', error);
          this.$message.error('失败!');
        });
      },
      back() {
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
        axios.get("http://localhost:8080/Pet/list").then((result) => {
            this.tableData=result.data.data
            this.$message({
            showClose: true,
            message: '数据已加载',
            type: 'success'
          });
        });
        axios.get('http://localhost:8080/Common/tagAll').then((response)=>{
          this.tableData1 = response.data.data;
        })
        this.loading = true;
          setTimeout(() => {
            this.loading = false;
          }, 1000);
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
    overflow: hidden;
  }
  </style>