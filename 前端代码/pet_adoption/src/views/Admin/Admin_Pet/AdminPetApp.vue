<template>
    <div class="head2"> 
      <el-container>
        <el-header style="display: flex; height: 100px; background-color:	#FFDEAD ;border-radius:15px;box-shadow: 2px 2px 2px 2px #BEBEBE;" >
          <i
            class="el-icon-chicken"
            style="
              font-size: 40px;
              height: 40px;
              align-self: center;
              margin-left: 50px;">
          </i>
          <h3 style="margin-left: 5px; align-self: center">领养情况</h3>
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
  
          <el-main style="">
            <el-button type="info" icon="el-icon-user-solid" circle @click="back"></el-button>
            <el-button @click="drawer = true" type="primary" icon="el-icon-thumb" circle></el-button>
            <el-button type="primary" icon="el-icon-refresh-right" circle @click="load"></el-button>
            <hr style="margin: 10px 0px 10px 0px;">
            <el-input
                placeholder="账户名查询"
                v-model="inputSelect1"
                @change="selectInput"
                prefix-icon="el-icon-search"
                style="width: 200px;"
                clearable>
            </el-input>
            <el-input
                placeholder="种类查询"
                v-model="inputSelect2"
                @change="selectInput"
                prefix-icon="el-icon-search"
                style="width: 200px; margin-left: 20px;"
                clearable>
            </el-input>
            <el-table el-table :data="tableData" 
                        v-loading="loading"
                        border 
                        style="width: 100%; border-radius: 15px; margin-top: 10px;border: 2px solid #ccc" 
                        max-height="580px">
                    <el-table-column
                    fixed
                    prop="adoptionRecordsId"
                    sortable
                    label="领养编号"
                    width="120px">
                    </el-table-column>
                    <el-table-column
                    fixed
                    prop="username"
                    sortable
                    label="用户名"
                    width="120px">
                    </el-table-column>
                    <el-table-column
                    prop="petId"
                    sortable
                    label="宠物编号"
                    width="120px">
                    </el-table-column>
                    <el-table-column
                    prop="breed"
                    sortable
                    label="品种"
                    width="120px">
                    </el-table-column>
                    <el-table-column
                    prop="adoptionTime"
                    sortable
                    label="领养时间"
                    width="120px">
                    </el-table-column>
                    <el-table-column
                    prop="adoptionStatus"
                    label="领养状态"
                    width="120px">
                    <template slot-scope="scope">
                          <span v-if="scope.row.adoptionStatus == 1">已领养</span>
                          <span v-else-if="scope.row.adoptionStatus == 0">已归还</span>
                        </template>
                    </el-table-column>
                    <el-table-column
                    fixed="right"
                    label="操作"
                    width="100">
                    <template slot-scope="scope">
                    <el-button @click="handleClick(scope.row)" type="primary" round size="mini">查看</el-button>
                    </template>
                </el-table-column>
            </el-table>
 
            <el-dialog :visible.sync="dialogVisible" title="查看宠物信息">
              <el-form ref="form" :model="form" label-width="120px">
                <el-form-item label="宠物编号">
                  <el-input v-model="form.petId" placeholder="请输入宠物编号" disabled="disabled"></el-input>
                </el-form-item>

                <el-form-item label="种类">
                  <el-input v-model="form.category" placeholder="请输入种类" disabled="disabled"></el-input>
                </el-form-item>

                <el-form-item label="品种">
                  <el-input v-model="form.breed" placeholder="请输入品种" disabled="disabled"></el-input>
                </el-form-item>

                <el-form-item label="名字">
                  <el-input v-model="form.petName" placeholder="请输入名字" disabled="disabled"></el-input>
                </el-form-item>

                <el-form-item label="年龄">
                  <el-input v-model="form.age" placeholder="请输入年龄" disabled="disabled"></el-input>
                </el-form-item>

                <el-form-item label="性别">
                  <el-input v-model="form.gender" placeholder="请输入性别" disabled="disabled"></el-input>
                </el-form-item>

                <el-form-item label="体重">
                  <el-input v-model="form.weight" placeholder="请输入体重" disabled="disabled"></el-input>
                </el-form-item>

                <el-form-item label="颜色">
                  <el-input v-model="form.color" placeholder="请输入颜色" disabled="disabled"></el-input>
                </el-form-item>

                <el-form-item label="是否绝育">
                  <el-switch v-model="form.neutered" disabled="disabled"></el-switch>
                </el-form-item>

                <el-form-item label="是否有领养历史">
                  <el-switch v-model="form.adoptionHistory" disabled="disabled"></el-switch>
                </el-form-item>

                <el-form-item label="领养状态">
                  <el-select v-model="form.adoptionStatus" placeholder="请选择领养状态" disabled="disabled">
                    <el-option label="未领养" :value="0"></el-option>
                    <el-option label="正在领养" :value="1"></el-option>
                    <el-option label="不能领养" :value="3"></el-option>
                  </el-select>
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
        inputSelect1:'',
        inputSelect2:'',
        dialogVisible:false,
        inputSelect:'',
        drawer: false,
        tableData: [{
        },],
        form:{
          adoptionStatus:0,
        },
        }
    },
    methods: {
    selectInput(){
          const username =this.inputSelect1 || '';
          const breed =this.inputSelect2 || '';
          axios.get(`http://localhost:8080/Common/selectDyRecords?username=${username}&breed=${breed}`)
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
        this.dialogVisible = true;
        console.log(row.petId)
        axios.get(
          `http://localhost:8080/Pet/selectById/${row.petId}`,
        )
          .then(response => {
            this.form = response.data.data[0];

      })
          .catch(error => {
            console.error('获取健康信息失败:', error);
            this.dialogVisible=false
            this.$alert('是否添加', '获取健康信息失败', {
            confirmButtonText: '确定',
            callback: action => {
              this.$message({
                type: 'info',
                message: `action: ${ action }`
              });
              this.addHFun();
            }
          });
            this.$message.error('获取健康信息失败!');
          });
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
      axios.get("http://localhost:8080/Common/selectRecords").then((result) => {
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