export interface CurrentUser {
    name: string
    avatar: string
    userid: string
    notice: NoticeType[]
    email: string
    signature: string
    title: string
    group: string
    tags: TagType[]
    notifyCount: number
    unreadCount: number
    country: string
    geographic: GeographicType
    address: string
    phonenumber: string
}